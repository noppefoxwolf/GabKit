//
//  Topic.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/11/11.
//

import Foundation

public class Topic: Codable {
  public let id: String
  public let createdAt: Date
  public let isFeatured: Bool
  public let title: String
  public let category: Int
}
