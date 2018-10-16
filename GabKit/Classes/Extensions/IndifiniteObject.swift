//
//  IndifiniteObject.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/16.
//

import Foundation

public class AttachmentObject: Decodable {
  public let value: Any
  
  required public init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    if let value = try? container.decode(Attachment.Media.self) {
      self.value = value
    } else if let value = try? container.decode([Attachment.Media].self) {
      self.value = value
    } else {
      let value = try container.decode(Attachment.URL.self)
      self.value = value
    }
  }
}
