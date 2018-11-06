//
//  PostResponseType.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/20.
//

import Foundation

public enum PostResponseType: Codable, Equatable {
  case post
  case repost
  case unknown(String)
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    let key = try container.decode(String.self)
    switch key {
    case "post":
      self = .post
    case "repost":
      self = .repost
    default:
      self = .unknown(key)
    }
  }
  
  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    switch self {
    case .post:
      try container.encode("post")
    case .repost:
      try container.encode("repost")
    case .unknown(let key):
      try container.encode(key)
    }
  }
}
