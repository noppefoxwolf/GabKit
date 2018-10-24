//
//  Attachment.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/10.
//

import Foundation

public enum Attachment: Decodable {
  case media(Attachment.Media)
  case medias([Attachment.Media])
  case url(Attachment.URL)
  case giphy(String)
  case youtube(String)
  case unknown
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: AnyKey.self)
    let key = try container.decode(String.self, forKey: AnyKey(stringValue: "type")!)
    switch key {
    case "media":
      if let value = try? container.decode(Attachment.Media.self, forKey: AnyKey(stringValue: "value")!) {
        self = .media(value)
      } else if let value = try? container.decode([Attachment.Media].self, forKey: AnyKey(stringValue: "value")!) {
        self = .medias(value)
      } else {
        self = .unknown
      }
    case "url":
      if let value = try? container.decode(Attachment.URL.self, forKey: AnyKey(stringValue: "value")!) {
        self = .url(value)
      } else {
        self = .unknown
      }
    case "giphy":
      if let value = try? container.decode(String.self, forKey: AnyKey(stringValue: "value")!) {
        self = .giphy(value)
      } else {
        self = .unknown
      }
    case "youtube":
      if let value = try? container.decode(String.self, forKey: AnyKey(stringValue: "value")!) {
        self = .youtube(value)
      } else {
        self = .unknown
      }
    default:
      self = .unknown
    }
  }
}

struct AnyKey: CodingKey {
  var stringValue: String
  var intValue: Int?
  
  init?(stringValue: String) {
    self.stringValue = stringValue
  }
  
  init?(intValue: Int) {
    self.stringValue = String(intValue)
    self.intValue = intValue
  }
}
