//
//  Giphy.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/25.
//

import Foundation

extension Attachment {
  public class Giphy: Decodable {
    public let url: String
    
    required public init(from decoder: Decoder) throws {
      let container = try decoder.singleValueContainer()
      self.url = try container.decode(String.self)
    }
  }
}
