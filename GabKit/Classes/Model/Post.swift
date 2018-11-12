//
//  Post.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/10.
//

import Foundation

public class Post: Codable {
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

extension Post: Equatable {
  public static func == (lhs: Post, rhs: Post) -> Bool {
    guard lhs.id == rhs.id else { return false }
    guard lhs.createdAt == rhs.createdAt else { return false }
    guard lhs.revisedAt == rhs.revisedAt else { return false }
    guard lhs.edited == rhs.edited else { return false }
    guard lhs.body == rhs.body else { return false }
    guard lhs.bodyHtml == rhs.bodyHtml else { return false }
    guard lhs.bodyHtmlSummary == rhs.bodyHtmlSummary else { return false }
    guard lhs.bodyHtmlSummaryTruncated == rhs.bodyHtmlSummaryTruncated else { return false }
    guard lhs.liked == rhs.liked else { return false }
    guard lhs.disliked == rhs.disliked else { return false }
    guard lhs.bookmarked == rhs.bookmarked else { return false }
    guard lhs.repost == rhs.repost else { return false }
    guard lhs.reported == rhs.reported else { return false }
    guard lhs.score == rhs.score else { return false }
    guard lhs.likeCount == rhs.likeCount else { return false }
    guard lhs.dislikeCount == rhs.dislikeCount else { return false }
    guard lhs.replyCount == rhs.replyCount else { return false }
    guard lhs.repostCount == rhs.repostCount else { return false }
    guard lhs.isQuote == rhs.isQuote else { return false }
    guard lhs.isReply == rhs.isReply else { return false }
    guard lhs.attachment == rhs.attachment else { return false }
    guard lhs.language == rhs.language else { return false }
    guard lhs.nsfw == rhs.nsfw else { return false }
    guard lhs.isPremium == rhs.isPremium else { return false }
    guard lhs.isLocked == rhs.isLocked else { return false }
    guard lhs.premiumMinTier == rhs.premiumMinTier else { return false }
    guard lhs.currentTier == rhs.currentTier else { return false }
    guard lhs.user == rhs.user else { return false }
    guard lhs.parent == rhs.parent else { return false }
    guard lhs.conversationParent == rhs.conversationParent else { return false }
    return true
  }
}
