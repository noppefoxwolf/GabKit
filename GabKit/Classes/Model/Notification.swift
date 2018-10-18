//
//  Notification.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/12.
//

import Foundation

public enum NotificationType: String, Decodable {
  case repost
  case like
  case follow
  case mention
}

public class Notification: Decodable {
  public let id: String
  public let createdAt: Date
  public let url: String
  public let type: NotificationType
  public let message: String
  public let read: Bool
  public let post: Post?
  public let actuser: RelatedUserDetail?
}
