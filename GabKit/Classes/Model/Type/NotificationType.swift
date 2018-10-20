//
//  NotificationType.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/20.
//

import Foundation

public enum NotificationType: Decodable, Equatable {
  case repost
  case like
  case follow
  case mention
  case unknown(String)
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    let key = try container.decode(String.self)
    switch key {
    case "repost":
      self = .repost
    case "like":
      self = .like
    case "follow":
      self = .follow
    case "mention":
      self = .mention
    default:
      self = .unknown(key)
    }
  }
}
