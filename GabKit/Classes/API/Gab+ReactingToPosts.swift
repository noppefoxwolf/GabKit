//
//  Gab+ReactingToPosts.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/10.
//

import Foundation

extension Gab {
  public func upvote(postID: Int, success: ActionSuccess? = nil, failure: Failure? = nil) {
    post(path: "posts/\(postID)/upvote") { (actionResponse: ActionResponse?, response, error) in
      if let actionResponse = actionResponse {
        success?(actionResponse)
      } else if let error = error {
        failure?(error)
      }
    }
  }
  
  public func downvote(postID: Int, success: ActionSuccess? = nil, failure: Failure? = nil) {
    post(path: "posts/\(postID)/downvote") { (actionResponse: ActionResponse?, response, error) in
      if let actionResponse = actionResponse {
        success?(actionResponse)
      } else if let error = error {
        failure?(error)
      }
    }
  }
  
  public func removeUpvote(postID: Int, success: ActionSuccess? = nil, failure: Failure? = nil) {
    delete(path: "posts/\(postID)/upvote") { (actionResponse: ActionResponse?, response, error) in
      if let actionResponse = actionResponse {
        success?(actionResponse)
      } else if let error = error {
        failure?(error)
      }
    }
  }
  
  public func removeDownvote(postID: Int, success: ActionSuccess? = nil, failure: Failure? = nil) {
    delete(path: "posts/\(postID)/downvote") { (actionResponse: ActionResponse?, response, error) in
      if let actionResponse = actionResponse {
        success?(actionResponse)
      } else if let error = error {
        failure?(error)
      }
    }
  }
  
  public func repost(postID: Int, success: ActionSuccess? = nil, failure: Failure? = nil) {
    post(path: "posts/\(postID)/repost") { (actionResponse: ActionResponse?, response, error) in
      if let actionResponse = actionResponse {
        success?(actionResponse)
      } else if let error = error {
        failure?(error)
      }
    }
  }
  
  public func removeRepost(postID: Int, success: ActionSuccess? = nil, failure: Failure? = nil) {
    delete(path: "posts/\(postID)/repost") { (actionResponse: ActionResponse?, response, error) in
      if let actionResponse = actionResponse {
        success?(actionResponse)
      } else if let error = error {
        failure?(error)
      }
    }
  }
  
  public func getPostDetail(postID: Int, success: PostDetailSuccess? = nil, failure: Failure? = nil) {
    get(path: "posts/\(postID)") { (post: PostDetail?, response, error) in
      if let post = post {
        success?(post)
      } else if let error = error {
        failure?(error)
      }
    }
  }
}
