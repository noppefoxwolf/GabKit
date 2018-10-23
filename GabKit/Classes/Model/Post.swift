//
//  Post.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/10.
//

import Foundation

public class Post: Decodable {
  public let id: Int
  public let createdAt: Date
  public let revisedAt: Date?
  public let edited: Bool
  public let body: String
  public let bodyHtml: String?
  public let bodyHtmlSummary: String?
  public let bodyHtmlSummaryTruncated: Bool
  public let liked: Bool
  public let disliked: Bool
  public let bookmarked: Bool
  public let repost: Bool
  public let reported: Bool
  public let score: Int
  public let likeCount: Int
  public let dislikeCount: Int
  public let replyCount: Int
  public let repostCount: Int
  public let isQuote: Bool
  public let isReply: Bool
  public let attachment: Attachment
  public let language: String?
  public let nsfw: Bool
  public let isPremium: Bool
  public let isLocked: Bool
  public let premiumMinTier: Int
  public let currentTier: Int
  public let user: User
  public let parent: Post?
  public let conversationParent: Post?
}
