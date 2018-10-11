//
//  Gab.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/09.
//

import Foundation

#if os(macOS)
import AppKit
public typealias Image = NSImage
#else
import UIKit
public typealias Image = UIImage
#endif

public enum Scope: String {
  case read
  case engageUser = "engage-user"
  case engagePost = "engage-post"
  case writePost = "write-post"
  case notifications
}

public enum GabURL: String {
  case api = "https://api.gab.com/v1.0/"
  case outh = "https://api.gab.com/oauth/"
}

extension Foundation.Notification.Name {
  static let gabCallback = Foundation.Notification.Name(rawValue: "GabKit.CallbackNotificationName")
}

public typealias Success = (() -> Void)
public typealias FeedSuccess = ((FeedResponse) -> Void)
public typealias PostSuccess = ((PostResponse) -> Void)
public typealias PostDetailSuccess = ((PostDetail) -> Void)
public typealias UserDetailSuccess = ((UserDetail) -> Void)
public typealias RelatedUsersSuccess = ((RelatedUsersResponse) -> Void)
public typealias UsersSuccess = ((UsersResponse) -> Void)
public typealias GroupDetailSuccess = ((GroupDetail) -> Void)
public typealias GroupsSuccess = ((GroupsResponse) -> Void)
public typealias NotificationsSuccess = ((NotificationsResponse) -> Void)
public typealias ActionSuccess = ((ActionResponse) -> Void)
public typealias ModerationLogsSuccess = ((ModerationLogsResponse) -> Void)
public typealias UploadSuccess = ((UploadFileResponse) -> Void)
public typealias Failure = ((Error) -> Void)

public final class Gab {
  internal let clientID: String
  internal let clientSecret: String
  internal let scopes: [Scope]
  internal var credential: Credential? = nil
  
  public init(clientID: String, clientSecret: String, credential: Credential? = nil, scopes: Scope...) {
    self.clientID = clientID
    self.clientSecret = clientSecret
    self.credential = credential
    self.scopes = scopes
  }
}

extension Gab {
  internal struct CallbackNotification {
    static let optionsURLKey = "GabKitCallbackNotificationOptionsURLKey"
  }
}

