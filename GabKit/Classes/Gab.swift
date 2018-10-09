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

public final class Gab {
  private let clientID: String
  private let scopes: [Scope]
  
  public init(clientID: String, scopes: Scope...) {
    self.clientID = clientID
    self.scopes = scopes
  }
}

extension Gab {
  internal struct CallbackNotification {
    static let optionsURLKey = "GabKitCallbackNotificationOptionsURLKey"
  }
}
