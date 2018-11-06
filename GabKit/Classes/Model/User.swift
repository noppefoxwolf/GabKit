//
//  User.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/10.
//

import Foundation

public protocol UserType {
  var id: Int { get }
  var name: String { get }
  var username: String { get }
  var pictureUrl: String { get }
  var verified: Bool { get }
  var isDonor: Bool { get }
  var isInvestor: Bool { get }
  var isPro: Bool { get }
  var isPrivate: Bool { get }
  var isPremium: Bool { get }
}

public class User: Codable, UserType {
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

