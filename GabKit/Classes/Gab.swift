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

public enum Scope: String, Codable {
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

public typealias Success<T> = ((T) -> Void)
public typealias AuthSuccess = Success<Credential>
public typealias FeedSuccess = Success<FeedResponse>
public typealias PostSuccess = Success<PostResponse>
public typealias PostDetailSuccess = Success<PostDetail>
public typealias UserDetailSuccess = Success<UserDetail>
public typealias RelatedUsersSuccess = Success<RelatedUsersResponse>
public typealias UsersSuccess = Success<UsersResponse>
public typealias GroupDetailSuccess = Success<GroupDetail>
public typealias GroupsSuccess = Success<GroupsResponse>
public typealias NotificationsSuccess = Success<NotificationsResponse>
public typealias ActionSuccess = Success<ActionResponse>
public typealias ModerationLogsSuccess = Success<ModerationLogsResponse>
public typealias UploadSuccess = Success<UploadFileResponse>
public typealias Failure = ((Error) -> Void)
public typealias UploadProgress = ((Progress) -> Void)

public final class Gab {
  internal let clientID: String
  internal let clientSecret: String
  internal let scopes: [Scope]
  internal var credential: Credential? = nil
  
  public init(clientID: String, clientSecret: String, credential: Credential? = nil, scopes: [Scope]) {
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

