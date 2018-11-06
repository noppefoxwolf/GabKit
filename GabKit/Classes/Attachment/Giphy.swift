//
//  Giphy.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/25.
//

import Foundation

extension Attachment {
  public class Giphy: Codable {
    public let url: String
    
    required public init(from decoder: Decoder) throws {
      let container = try decoder.singleValueContainer()
      self.url = try container.decode(String.self)
    }
    
    public func encode(to encoder: Encoder) throws {
      var container = encoder.singleValueContainer()
      try container.encode(url)
    }
  }
}
