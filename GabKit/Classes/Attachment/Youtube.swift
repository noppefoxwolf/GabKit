//
//  Youtube.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/25.
//

import Foundation

extension Attachment {
  public class Youtube: Decodable {
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
  }
}
