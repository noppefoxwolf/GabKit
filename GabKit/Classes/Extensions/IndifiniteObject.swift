//
//  IndifiniteObject.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/16.
//

import Foundation

public enum AttachmentObject: Decodable {
  case media(Attachment.Media)
  case medias([Attachment.Media])
  case url(Attachment.URL)
  case unknown
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    if let media = try? container.decode(Attachment.Media.self) {
      self = .media(media)
    } else if let medias = try? container.decode([Attachment.Media].self) {
      self = .medias(medias)
    } else if let url = try? container.decode(Attachment.URL.self) {
      self = .url(url)
    } else {
      self = .unknown
    }
  }
}
