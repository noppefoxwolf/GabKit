//
//  GroupDetail.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/12.
//

import UIKit

public class GroupDetail: Codable, GroupType {
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
  public let users: UsersResponse
  
  public let isFavorited: Bool
}
