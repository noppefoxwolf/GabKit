//
//  UserFeedResponse.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/11/11.
//

import Foundation

public class _UserFeedResponse: Codable {
  public let data: [PostResponse]
  public let noMore: Bool
  public let pinnedPost: PostResponse?
}
