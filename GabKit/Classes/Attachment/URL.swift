//
//  URL.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/16.
//

import Foundation

extension Attachment {
  public class URL: Codable {
    public let image: String
    public let source: String
    public let description: String
    public let url: String
    public let title: String
  }
}

extension Attachment.URL: Equatable {
  public static func == (lhs: Attachment.URL, rhs: Attachment.URL) -> Bool { 
    guard lhs.image == rhs.image else { return false }
    guard lhs.source == rhs.source else { return false }
    guard lhs.description == rhs.description else { return false }
    guard lhs.url == rhs.url else { return false }
    guard lhs.title == rhs.title else { return false }
    return true
  }
}
