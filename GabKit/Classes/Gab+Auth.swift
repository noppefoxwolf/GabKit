//
//  Gab+Auth.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/10.
//

import SafariServices

extension Gab {
  public func authorize(with callbackURL: URL,
                        presentingFrom presenting: UIViewController) {
    NotificationCenter.default.addObserver(forName: .gabCallback, object: nil, queue: .main) { (notification) in
      NotificationCenter.default.removeObserver(self)
      presenting.presentedViewController?.dismiss(animated: true, completion: nil)
      print("hogehgoe")
    }
    
    var urlComponents = URLComponents(string: "https://api.gab.com/oauth/authorize")!
    let responseType = URLQueryItem(name: "response_type", value: "code")
    let clientID = URLQueryItem(name: "client_id", value: "xxxxxxx")
    let redirectURI = URLQueryItem(name: "redirect_uri", value: "xxxxxx")
    let scope = URLQueryItem(name: "scope", value: "read")
    urlComponents.queryItems = [responseType, clientID, redirectURI, scope]
    
    let vc = SFSafariViewController(url: urlComponents.url!)
    presenting.present(vc, animated: true, completion: nil)
  }
  
  public static func handleURL(_ url: URL) {
    let notification = Notification(name: .gabCallback, object: nil, userInfo: [CallbackNotification.optionsURLKey: url])
    NotificationCenter.default.post(notification)
  }
}
