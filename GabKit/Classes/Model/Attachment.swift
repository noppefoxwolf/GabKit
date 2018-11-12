//
//  Attachment.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/10.
//

import Foundation

public enum Attachment: Codable {
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
  
  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: AnyKey.self)
    switch self {
    case .media(let media):
      try container.encode("media", forKey: AnyKey(stringValue: "type")!)
      try container.encode(media, forKey: AnyKey(stringValue: "value")!)
    case .medias(let medias):
      try container.encode("media", forKey: AnyKey(stringValue: "type")!)
      try container.encode(medias, forKey: AnyKey(stringValue: "value")!)
    case .url(let url):
      try container.encode("url", forKey: AnyKey(stringValue: "type")!)
      try container.encode(url, forKey: AnyKey(stringValue: "value")!)
    case .giphy(let giphy):
      try container.encode("giphy", forKey: AnyKey(stringValue: "type")!)
      try container.encode(giphy, forKey: AnyKey(stringValue: "value")!)
    case .youtube(let youtube):
      try container.encode("youtube", forKey: AnyKey(stringValue: "type")!)
      try container.encode(youtube, forKey: AnyKey(stringValue: "value")!)
    case .unknown(let key):
      try container.encodeIfPresent(key, forKey: AnyKey(stringValue: "type")!)
      try container.encodeNil(forKey: AnyKey(stringValue: "value")!)
    }
  }
}

extension Attachment: Equatable {
  public static func == (lhs: Attachment, rhs: Attachment) -> Bool {
    if case let .giphy(lgiphy) = lhs, case let .giphy(rgiphy) = rhs {
      return lgiphy == rgiphy
    } else if case let .youtube(lyoutube) = lhs, case let .youtube(ryoutube) = rhs {
      return lyoutube == ryoutube
    } else if case let .media(lmedia) = lhs, case let .media(rmedia) = rhs {
      return lmedia == rmedia
    } else if case let .medias(lmedias) = lhs, case let .medias(rmedias) = rhs {
      return lmedias == rmedias
    } else if case let .url(lurl) = lhs, case let .url(rurl) = rhs {
      return lurl == rurl
    } else if case let .unknown(lkey) = lhs, case let .unknown(rkey) = rhs {
      return lkey == rkey
    } else {
      return false
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
