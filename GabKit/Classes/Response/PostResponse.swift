//
//  PostResponse.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/10.
//

import Foundation

public class PostResponse: Codable {
  public let id: String
  public let publishedAt: Date
  public let type: PostResponseType
  public let actuser: User
  public let post: Post
}

extension PostResponse: Equatable {
  public static func == (lhs: PostResponse, rhs: PostResponse) -> Bool {
    guard lhs.id == rhs.id else { return false }
    guard lhs.publishedAt == rhs.publishedAt else { return false }
    guard lhs.type == rhs.type else { return false }
    guard lhs.actuser == rhs.actuser else { return false }
    guard lhs.post == rhs.post else { return false }
    return true
  }
}
