//
//  Gab+UserDetails.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/10.
//

import Foundation

extension Gab {
  public func getMe(success: ((User) -> Void)? = nil, failure:((Error) -> Void)? = nil) {
    get(success: success, failure: failure)
  }
  
  public func getUser(username: String) {
    
  }
  
  public func getFollowers(username: String) {
    
  }
  
  public func getFollowedUsers(username: String) {
    
  }
}
