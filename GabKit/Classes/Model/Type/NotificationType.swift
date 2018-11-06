//
//  NotificationType.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/20.
//

import Foundation

public enum NotificationType: Codable, Equatable {
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
  
  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    switch self {
    case .repost:
      try container.encode("repost")
    case .like:
      try container.encode("like")
    case .follow:
      try container.encode("follow")
    case .mention:
      try container.encode("mention")
    case .unknown(let key):
      try container.encode(key)
    }
  }
}
