//
//  Gab.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/09.
//

import Foundation

public enum Scope: String {
  case read
  case engageUser = "engage-user"
  case engagePost = "engage-post"
  case writePost = "write-post"
  case notifications
}

extension Notification.Name {
  static let gabCallback = Notification.Name(rawValue: "GabKit.CallbackNotificationName")
}

public typealias Success = (() -> Void)
public typealias FeedSuccess = ((FeedResponse) -> Void)
public typealias PostSuccess = ((PostResponse) -> Void)
public typealias Failure = ((Error) -> Void)

public final class Gab {
  internal let clientID: String
  internal let clientSecret: String
  internal let scopes: [Scope]
  internal var credential: Credential? = nil
  
  public init(clientID: String, clientSecret: String, scopes: Scope...) {
    self.clientID = clientID
    self.clientSecret = clientSecret
    self.scopes = scopes
  }
}

extension Gab {
  internal struct CallbackNotification {
    static let optionsURLKey = "GabKitCallbackNotificationOptionsURLKey"
  }
}
