//
//  PostResponseType.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/20.
//

import Foundation

public enum PostResponseType: Decodable, Equatable {
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
}
