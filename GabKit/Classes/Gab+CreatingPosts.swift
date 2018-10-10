//
//  Gab+CreatingPosts.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/10.
//

import Foundation

extension Gab {
  public enum CreatePostMode {
    case post
    case reply(postID: String)
    case quote(postID: String)
  }
  
  public func createPost(_ body: String,
                         mode: CreatePostMode = .post,
                         nsfw: Bool = false,
                         premiumMinTier: Int? = nil,
                         group: String? = nil,
                         topic: String? = nil,
                         pollOptions: [String]? = nil,
                         success: PostSuccess? = nil,
                         failure: Failure? = nil) {
    let params: [String : Any] = [
      "body" : body
    ]
    post(url: "https://api.gab.com/v1.0/posts", params: params) { (postResponse: PostResponse?, response, error) in
      if let postResponse = postResponse {
        success?(postResponse)
      } else if let error = error {
        failure?(error)
      }
    }
  }
}
