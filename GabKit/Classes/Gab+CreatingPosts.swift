//
//  Gab+CreatingPosts.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/10.
//

import Foundation

extension Gab {
  func createQuote() {}
  func createReply() {}
  
  public func createPost(_ body: String,
                         nsfw: Bool = false,
                         premiumMinTier: Int? = nil,
                         group: String? = nil,
                         topic: String? = nil,
                         pollOptions: [String]? = nil,
                         success: PostSuccess? = nil,
                         failure: Failure? = nil) {
    var params: [String : Any] = ["body" : body, "nsfw" : nsfw]
    params["premium_min_tier"] = premiumMinTier
    params["group"] = group
    params["topic"] = topic
    
    if let pollOptions = pollOptions, pollOptions.count >= 2, pollOptions.count <= 4 {
      params["poll"] = 1
      for (i, option) in pollOptions.enumerated() {
        params["poll_option_\(i + 1)"] = option
      }
    } else {
      params["poll"] = 0
    }
    
    post(url: "https://api.gab.com/v1.0/posts", params: params) { (postResponse: PostResponse?, response, error) in
      if let postResponse = postResponse {
        success?(postResponse)
      } else if let error = error {
        failure?(error)
      }
    }
  }
}
