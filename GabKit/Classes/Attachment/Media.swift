//
//  Media.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/10.
//

import Foundation

extension Attachment {
  public class Media: Codable {
    public let id: String
    public let urlThumbnail: String
    public let urlFull: String
    public let width: Int
    public let height: Int
  }
}

extension Attachment.Media: Equatable {
  public static func == (lhs: Attachment.Media, rhs: Attachment.Media) -> Bool {
    guard lhs.id == rhs.id else { return false }
    guard lhs.urlThumbnail == rhs.urlThumbnail else { return false }
    guard lhs.urlFull == rhs.urlFull else { return false }
    guard lhs.width == rhs.width else { return false }
    guard lhs.height == rhs.height else { return false }
    return true
  }
}
