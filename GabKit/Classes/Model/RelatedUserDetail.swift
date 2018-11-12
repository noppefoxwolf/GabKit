//
//  RelatedUserDetail.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/12.
//

import Foundation

public class RelatedUserDetail: Codable, UserType {
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

extension RelatedUserDetail: Equatable {
  public static func == (lhs: RelatedUserDetail, rhs: RelatedUserDetail) -> Bool {
    guard lhs.id == rhs.id else { return false }
    guard lhs.name == rhs.name else { return false }
    guard lhs.username == rhs.username else { return false }
    guard lhs.pictureUrl == rhs.pictureUrl else { return false }
    guard lhs.verified == rhs.verified else { return false }
    guard lhs.isPro == rhs.isPro else { return false }
    guard lhs.isDonor == rhs.isDonor else { return false }
    guard lhs.isInvestor == rhs.isInvestor else { return false }
    guard lhs.isPrivate == rhs.isPrivate else { return false }
    guard lhs.isPremium == rhs.isPremium else { return false }
    guard lhs.createdAtMonthLabel == rhs.createdAtMonthLabel else { return false }
    guard lhs.followerCount == rhs.followerCount else { return false }
    guard lhs.followingCount == rhs.followingCount else { return false }
    guard lhs.postCount == rhs.postCount else { return false }
    guard lhs.pictureUrlFull == rhs.pictureUrlFull else { return false }
    guard lhs.following == rhs.following else { return false }
    guard lhs.followed == rhs.followed else { return false }
    guard lhs.isTippable == rhs.isTippable else { return false }
    guard lhs.isAccessible == rhs.isAccessible else { return false }
    guard lhs.followPending == rhs.followPending else { return false }
    return true
  }
}
