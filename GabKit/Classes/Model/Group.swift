//
//  Group.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/12.
//

import Foundation

public protocol GroupType {
  var id: String { get }
  var title: String { get }
  var pinnedPostId: String { get }
  var archivedAt: Date? { get }
  var coverUrl: String { get }
  var description: String { get }
  var userCount: Int { get }
  var isJoined: Bool { get }
  var canJoin: Bool { get }
  var role: String? { get }
  var isPrivate: Bool { get }
  var users: UsersData { get }
}

public class Group: Codable, GroupType {
  public let id: String
  public let title: String
  public let pinnedPostId: String
  public let archivedAt: Date?
  public let coverUrl: String
  public let description: String
  public let userCount: Int
  public let isJoined: Bool
  public let canJoin: Bool
  public let role: String?
  public let isPrivate: Bool
  public let users: UsersData
}



