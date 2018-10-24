//
//  Media.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/10.
//

import Foundation

extension Attachment {
  public class Media: Decodable {
    public let id: String
    public let urlThumbnail: String
    public let urlFull: String
    public let width: Int
    public let height: Int
  }
}

