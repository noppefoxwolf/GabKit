//
//  PostResponse.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/10.
//

import Foundation

public class PostResponse: Decodable {
  public let id: String
  public let publishedAt: Date
  public let type: String
  public let actuser: User
  public let post: Post
}
