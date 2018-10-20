//
//  AttachmentType.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/16.
//

import Foundation

public enum AttachmentType: Decodable, Equatable {
  case media
  case url
  case giphy
  case youtube
  case unknown(String)
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    let key = try container.decode(String.self)
    switch key {
    case "media":
      self = .media
    case "url":
      self = .url
    case "giphy":
      self = .giphy
    case "youtube":
      self = .youtube
    default:
      self = .unknown(key)
    }
  }
}
