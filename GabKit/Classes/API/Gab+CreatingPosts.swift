//
//  Gab+CreatingPosts.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/10.
//

import Foundation

extension Gab {
  public func createQuote(_ body: String,
                   mediaAttachments: [String]? = nil,
                   quotePostID: Int,
                   nsfw: Bool = false,
                   success: PostSuccess? = nil,
                   failure: Failure? = nil) {
    publish(body,
            mediaAttachments: mediaAttachments,
            replyTo: quotePostID,
            isQuote: true,
            nsfw: nsfw,
            success: success,
            failure: failure)
  }
  
  public func createReply(_ body: String,
                   mediaAttachments: [String]? = nil,
                   replyTo: Int,
                   nsfw: Bool = false,
                   success: PostSuccess? = nil,
                   failure: Failure? = nil) {
    publish(body,
            mediaAttachments: mediaAttachments,
            replyTo: replyTo,
            nsfw: nsfw,
            success: success,
            failure: failure)
  }
  
  public func publish(_ body: String,
                      mediaAttachments: [String]? = nil,
                      replyTo: Int? = nil,
                      isQuote: Bool = false,
                      nsfw: Bool = false,
                      premiumMinTier: Int? = nil,
                      group: String? = nil,
                      topic: String? = nil,
                      pollOptions: [String]? = nil,
                      success: PostSuccess? = nil,
                      failure: Failure? = nil) {
    var params: [String : Any] = ["body" : body, "nsfw" : nsfw]
    params["reply_to"] = replyTo
    params["is_quote"] = isQuote
    params["premium_min_tier"] = premiumMinTier
    params["group"] = group
    params["topic"] = topic
    params["media_attachments"] = mediaAttachments
    
    if let pollOptions = pollOptions, pollOptions.count >= 2, pollOptions.count <= 4 {
      params["poll"] = 1
      for (i, option) in pollOptions.enumerated() {
        params["poll_option_\(i + 1)"] = option
      }
    } else {
      params["poll"] = 0
    }
    
    post(path: "posts", params: params) { (postResponse: PostResponse?, response, error) in
      if let postResponse = postResponse {
        success?(postResponse)
      } else if let error = error {
        failure?(error)
      }
    }
  }
  
  public func uploadImage(_ image: Image,
                          progress: UploadProgress? = nil,
                          success: UploadSuccess? = nil,
                          failure: Failure? = nil) {
    upload(path: "media-attachments/images",
           file: image.pngData()!,
           progressHandler: progress)
    { (uploadResponse: UploadFileResponse?, response, error) in
      if let uploadResponse = uploadResponse {
        success?(uploadResponse)
      } else if let error = error {
        failure?(error)
      }
    }
  }
}
