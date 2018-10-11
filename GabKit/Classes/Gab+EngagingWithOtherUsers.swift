//
//  Gab+EngagingWithOtherUsers.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/10.
//

import Foundation

extension Gab {
  public func follow(userID: Int, success: FeedSuccess? = nil, failure: Failure? = nil) {
    post(path: "users/\(userID)/follow", params: [:]) { (user: User?, response, error) in
      
    }
  }
  
  func unFollow(userID: String) {
    
  }
}
