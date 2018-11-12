//
//  Notification.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/12.
//

import Foundation

public class Notification: Codable {
  public let id: String
  public let createdAt: Date
  public let url: String
  public let type: NotificationType
  public let message: String
  public let read: Bool
  public let post: Post?
  public let actuser: RelatedUserDetail?
}

extension Notification: Equatable {
  public static func == (lhs: Notification, rhs: Notification) -> Bool {
    guard lhs.id == rhs.id else { return false }
    guard lhs.createdAt == rhs.createdAt else { return false }
    guard lhs.url == rhs.url else { return false }
    guard lhs.type == rhs.type else { return false }
    guard lhs.message == rhs.message else { return false }
    guard lhs.read == rhs.read else { return false }
    guard lhs.post == rhs.post else { return false }
    guard lhs.actuser == rhs.actuser else { return false }
    return true
  }
}
