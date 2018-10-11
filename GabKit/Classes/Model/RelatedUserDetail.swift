//
//  RelatedUserDetail.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/12.
//

import Foundation

public class RelatedUserDetail: Decodable, UserType {
  public let id: Int
  public let name: String
  public let username: String
  public let pictureUrl: String
  public let verified: Bool
  public let isPro: Bool
  public let isDonor: Bool
  public let isInvestor: Bool
  public let isPrivate: Bool
  public let isPremium: Bool
  
  public let createdAtMonthLabel: String
  public let followerCount: Int
  public let followingCount: Int
  public let postCount: Int
  public let pictureUrlFull: String
  public let following: Bool
  public let followed: Bool
  public let isTippable: Bool
  public let isAccessible: Bool
  public let followPending: Bool
}
