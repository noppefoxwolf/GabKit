//
//  Gab+Request.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/10.
//

import Foundation

extension Gab {
  enum ContentType {
    case json
    case multipart
    
    var value: String {
      switch self {
      case .json: return "application/json"
      case .multipart: return "multipart/form-data; boundary=\(Gab.boundary)"
      }
    }
  }
  
  private func headers(contentType: ContentType = .json,
                       authorizationMode: AuthorizationMode = .bearer) -> [String : String] {
    var headers: [String : String] = ["Content-Type": contentType.value]
    guard let accessToken = credential?.accessToken else { return headers }
    switch authorizationMode {
    case .bearer:
      headers["Authorization"] = "Bearer \(accessToken)"
    case .cookie:
      headers["Set-Cookie"] = "leravel_session=\(accessToken)"
    }
    return headers
  }
  
  internal func get<T: Decodable>(path: String,
                                  baseURL: GabURL = .api,
                                  params: [String : String?] = [:],
                                  authorizationMode: AuthorizationMode = .bearer,
                                  completionHandler: @escaping ((T?, URLResponse?, Error?) -> Void)) {
    _get(url: baseURL.rawValue + path,
         params: params,
         authorizationMode: authorizationMode,
         completionHandler: { (data, response, error) in
      var error: Error? = error
      var object: T? = nil
      if let data = data {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCaseOrKebabCase
        do {
          object = try decoder.decode(T.self, from: data)
        } catch (let e) {
          error = e
        }
      }
      completionHandler(object, response, error)
    })
  }
  
  private func _get(url urlString: String,
                    params: [String : String?],
                    authorizationMode: AuthorizationMode,
                    completionHandler: @escaping ((Data?, URLResponse?, Error?) -> Void)) {
    var urlComponents = URLComponents(string: urlString)!
    urlComponents.queryItems = params.compactMap({ URLQueryItem(name: $0, value: $1) })
    var request = URLRequest(url: urlComponents.url!)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers(authorizationMode: authorizationMode)
    URLSession.shared.dataTask(with: request, completionHandler: completionHandler).resume()
  }
  
  internal func post<T: Decodable>(path: String,
                                   baseURL: GabURL = .api,
                                   params: [String : Any] = [:],
                                   completionHandler: @escaping ((T?, URLResponse?, Error?) -> Void)) {
    _post(url: baseURL.rawValue + path, params: params) { (data, response, error) in
      var object: T? = nil
      if let data = data {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCaseOrKebabCase
        object = try? decoder.decode(T.self, from: data)
      }
      completionHandler(object, response, error)
    }
  }
  
  private func _post(url urlString: String,
                     params: [String : Any],
                     completionHandler: @escaping ((Data?, URLResponse?, Error?) -> Void)) {
    let url = URL(string: urlString)!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.httpBody = try! JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
    request.allHTTPHeaderFields = headers()
    URLSession.shared.dataTask(with: request, completionHandler: completionHandler).resume()
  }
  
  internal func delete<T: Decodable>(path: String,
                                     baseURL: GabURL = .api,
                                     completionHandler: @escaping ((T?, URLResponse?, Error?) -> Void)) {
    _delete(url: baseURL.rawValue + path) { (data, response, error) in
      var object: T? = nil
      if let data = data {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCaseOrKebabCase
        object = try? decoder.decode(T.self, from: data)
      }
      completionHandler(object, response, error)
    }
  }
  
  private func _delete(url urlString: String, completionHandler: @escaping ((Data?, URLResponse?, Error?) -> Void)) {
    let url = URL(string: urlString)!
    var request = URLRequest(url: url)
    request.httpMethod = "DELETE"
    request.allHTTPHeaderFields = headers()
    URLSession.shared.dataTask(with: request, completionHandler: completionHandler).resume()
  }
  
  internal func upload<T: Decodable>(path: String,
                                     file fileData: Data,
                                     baseURL: GabURL = .api,
                                     progressHandler: UploadProgress? = nil,
                                     completionHandler: @escaping ((T?, URLResponse?, Error?) -> Void)) {
    _upload(url: baseURL.rawValue + path, file: fileData, progressHandler: progressHandler) { (data, response, error) in
      var object: T? = nil
      if let data = data {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCaseOrKebabCase
        object = try? decoder.decode(T.self, from: data)
      }
      completionHandler(object, response, error)
    }
  }
  
  private func _upload(url urlString: String,
                       file fileData: Data,
                       progressHandler: UploadProgress?,
                     completionHandler: @escaping ((Data?, URLResponse?, Error?) -> Void)) {
    let url = URL(string: urlString)!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    let config = URLSessionConfiguration.default
    config.httpAdditionalHeaders = headers(contentType: .multipart)
    let session = URLSession(configuration: config,
                             delegate: ProgressDelegator(didUload: progressHandler),
                             delegateQueue: .main)
    session.uploadTask(with: request, from: httpBody(fileData), completionHandler: completionHandler).resume()
  }
  
  static let boundary = "----WebKitFormBoundaryZLdHZy8HNaBmUX0d"
  private func httpBody(_ fileAsData: Data, fileName: String = "image.png") -> Data {
    var data = "--\(Gab.boundary)\r\n".data(using: .utf8)!
    
    data += "Content-Disposition: form-data; name=\"file\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!
    data += "Content-Type: image/png\r\n".data(using: .utf8)!
    data += "\r\n".data(using: .utf8)!
    data += fileAsData
    data += "\r\n".data(using: .utf8)!
    data += "--\(Gab.boundary)--\r\n".data(using: .utf8)!
    
    return data
  }
}



fileprivate class ProgressDelegator: NSObject, URLSessionTaskDelegate {
  private let didUload: UploadProgress?
  private let progress: Progress
  
  init(didUload: UploadProgress?) {
    self.didUload = didUload
    self.progress = Progress()
  }
  
  func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
    didUload?(progress)
    completionHandler(.performDefaultHandling, nil)
  }
  
  func urlSession(_ session: URLSession, task: URLSessionTask,
                  didSendBodyData bytesSent: Int64,
                  totalBytesSent: Int64,
                  totalBytesExpectedToSend: Int64) {
    progress.completedUnitCount = totalBytesSent
    progress.totalUnitCount = totalBytesExpectedToSend
    didUload?(progress)
  }
  
  func urlSession(_ session: URLSession, task: URLSessionTask, didFinishCollecting metrics: URLSessionTaskMetrics) {
    didUload?(progress)
  }
}
