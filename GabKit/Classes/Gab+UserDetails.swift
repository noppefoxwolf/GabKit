//
//  Gab+UserDetails.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/10.
//

import Foundation

extension Gab {
  public func getMe(success: UserDetailSuccess? = nil, failure: Failure? = nil) {
    get(url: "https://api.gab.com/v1.0/me/", params: [:]) { (userDetail: UserDetail?, response, error) in
      if let userDetail = userDetail {
        success?(userDetail)
      } else if let error = error {
        failure?(error)
      }
    }
  }
  
  public func getUser(username: String, success: UserDetailSuccess? = nil, failure: Failure? = nil) {
    get(url: "https://api.gab.com/v1.0/users/\(username)", params: [:]) { (userDetail: UserDetail?, response, error) in
      if let userDetail = userDetail {
        success?(userDetail)
      } else if let error = error {
        failure?(error)
      }
    }
  }
  
  public func getFollowers(username: String) {
    
  }
  
  public func getFollowedUsers(username: String) {
    
  }
}
