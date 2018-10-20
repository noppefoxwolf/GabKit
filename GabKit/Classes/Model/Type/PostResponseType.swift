//
//  PostResponseType.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/20.
//

import Foundation

public enum PostResponseType: Decodable, Equatable {
  case post
  case unknown(String)
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    let key = try container.decode(String.self)
    switch key {
    case "post":
      self = .post
    default:
      self = .unknown(key)
    }
  }
}
