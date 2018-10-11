//
//  FeedResponse.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/11.
//

import Foundation

public class FeedResponse: Decodable {
  public let data: [PostResponse]
  public let noMore: Bool
}
