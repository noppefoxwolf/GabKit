//
//  Youtube.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/25.
//

import Foundation

extension Attachment {
  public class Youtube: Codable {
    public let id: String
    public var url: String {
      return "https://www.youtube.com/watch?v=\(id)"
    }
    public var thumbnailURL: String {
      return "https://i.ytimg.com/vi/\(id)/mqdefault.jpg"
    }
    
    required public init(from decoder: Decoder) throws {
      let container = try decoder.singleValueContainer()
      self.id = try container.decode(String.self)
    }
    
    public func encode(to encoder: Encoder) throws {
      var container = encoder.singleValueContainer()
      try container.encode(id)
    }
  }
}

extension Attachment.Youtube: Equatable {
  public static func == (lhs: Attachment.Youtube, rhs: Attachment.Youtube) -> Bool {
    return lhs.id == rhs.id
  }
}
