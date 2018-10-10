//
//  Gab+EngagingWithOtherUsers.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/10.
//

import Foundation

extension Gab {
  public func follow(userID: Int) {
    post(url: "https://api.gab.com/v1.0/users/\(userID)/follow", params: [:]) { (user: User?, response, error) in
      
    }
  }
  
  func unFollow(userID: String) {
    
  }
}
