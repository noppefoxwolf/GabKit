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
  case giphy(Attachment.Giphy)
  case youtube(Attachment.Youtube)
  case unknown(key: String?)
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: AnyKey.self)
    guard let key = try? container.decode(String.self, forKey: AnyKey(stringValue: "type")!) else {
      self = .unknown(key: nil)
      return
    }
    switch key {
    case "media":
      if let value = try? container.decode(Attachment.Media.self, forKey: AnyKey(stringValue: "value")!) {
        self = .media(value)
      } else if let value = try? container.decode([Attachment.Media].self, forKey: AnyKey(stringValue: "value")!) {
        self = .medias(value)
      } else {
        self = .unknown(key: key)
      }
    case "url":
      if let value = try? container.decode(Attachment.URL.self, forKey: AnyKey(stringValue: "value")!) {
        self = .url(value)
      } else {
        self = .unknown(key: key)
      }
    case "giphy":
      if let value = try? container.decode(Attachment.Giphy.self, forKey: AnyKey(stringValue: "value")!) {
        self = .giphy(value)
      } else {
        self = .unknown(key: key)
      }
    case "youtube":
      if let value = try? container.decode(Attachment.Youtube.self, forKey: AnyKey(stringValue: "value")!) {
        self = .youtube(value)
      } else {
        self = .unknown(key: key)
      }
    default:
      self = .unknown(key: key)
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
