//
//  User.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/10.
//

import Foundation

public class User: Decodable {
  public let id: Int
  public let name: String
  public let username: String
  public let pictureUrl: String
  public let verified: Bool
  public let isDonor: Bool
  public let isInvestor: Bool
  public let isPro: Bool
  public let isPrivate: Bool
  public let isPremium: Bool
}
