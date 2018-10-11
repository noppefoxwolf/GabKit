//
//  Gab+UserDetails.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/10.
//

import Foundation

extension Gab {
  public func getMe(success: UserDetailSuccess? = nil, failure: Failure? = nil) {
    get(path: "me", params: [:]) { (userDetail: UserDetail?, response, error) in
      if let userDetail = userDetail {
        success?(userDetail)
      } else if let error = error {
        failure?(error)
      }
    }
  }
  
  public func getUser(username: String,
                      success: UserDetailSuccess? = nil,
                      failure: Failure? = nil) {
    get(path: "users/\(username)", params: [:]) { (userDetail: UserDetail?, response, error) in
      if let userDetail = userDetail {
        success?(userDetail)
      } else if let error = error {
        failure?(error)
      }
    }
  }
  
  public func getFollowers(username: String,
                           before: Int? = nil,
                           success: RelatedUsersSuccess? = nil,
                           failure: Failure? = nil) {
    var params: [String : String?] = [:]
    if let before = before {
      params["before"] = "\(before)"
    }
    get(path: "users/\(username)/followers", params: params) { (users: RelatedUsersResponse?, response, error) in
      if let users = users {
        success?(users)
      } else if let error = error {
        failure?(error)
      }
    }
  }
  
  public func getFollowedUsers(username: String,
                               before: Int? = nil,
                               success: RelatedUsersSuccess? = nil,
                               failure: Failure? = nil) {
    var params: [String : String?] = [:]
    if let before = before {
      params["before"] = "\(before)"
    }
    get(path: "users/\(username)/following", params: params) { (users: RelatedUsersResponse?, response, error) in
      if let users = users {
        success?(users)
      } else if let error = error {
        failure?(error)
      }
    }
  }
}
