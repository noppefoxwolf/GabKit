//
//  Gab+Request.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/10.
//

import Foundation

extension Gab {
  internal func get<T: Decodable>(url urlString: String,
                                   params: [String : String?],
                                   completionHandler: @escaping ((T?, URLResponse?, Error?) -> Void)) {
    _get(url: urlString, params: params, completionHandler: { (data, response, error) in
      var error: Error? = error
      var object: T? = nil
      if let data = data {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase
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
                    completionHandler: @escaping ((Data?, URLResponse?, Error?) -> Void)) {
    var urlComponents = URLComponents(string: urlString)!
    urlComponents.queryItems = params.compactMap({ URLQueryItem(name: $0, value: $1) })
    var headers: [String : String] = ["Content-Type": "application/json"]
    if let accessToken = credential?.accessToken {
      headers["Authorization"] = "Bearer \(accessToken)"
    }
    var request = URLRequest(url: urlComponents.url!)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
    URLSession.shared.dataTask(with: request, completionHandler: completionHandler).resume()
  }
  
  internal func post<T: Decodable>(url urlString: String,
                                   params: [String : Any],
                                   completionHandler: @escaping ((T?, URLResponse?, Error?) -> Void)) {
    _post(url: urlString, params: params) { (data, response, error) in
      var object: T? = nil
      if let data = data {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        object = try? decoder.decode(T.self, from: data)
      }
      completionHandler(object, response, error)
    }
  }
  
  private func _post(url urlString: String,
                     params: [String : Any],
                     completionHandler: @escaping ((Data?, URLResponse?, Error?) -> Void)) {
    let url = URL(string: urlString)!
    var headers: [String : String] = ["Content-Type": "application/json"]
    if let accessToken = credential?.accessToken {
      headers["Authorization"] = "Bearer \(accessToken)"
    }
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.httpBody = try! JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
    request.allHTTPHeaderFields = headers
    URLSession.shared.dataTask(with: request, completionHandler: completionHandler).resume()
  }
}
