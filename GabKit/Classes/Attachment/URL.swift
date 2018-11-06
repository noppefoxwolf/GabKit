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
