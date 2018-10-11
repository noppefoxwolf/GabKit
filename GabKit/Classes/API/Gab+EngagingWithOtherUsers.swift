//
//  Gab+EngagingWithOtherUsers.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/10.
//

import Foundation

extension Gab {
  public func follow(userID: Int, success: ActionSuccess? = nil, failure: Failure? = nil) {
    post(path: "users/\(userID)/follow") { (actionResponse: ActionResponse?, response, error) in
      if let actionResponse = actionResponse {
        success?(actionResponse)
      } else if let error = error {
        failure?(error)
      }
    }
  }
  
  public func unFollow(userID: Int, success: ActionSuccess? = nil, failure: Failure? = nil) {
    delete(path: "users/\(userID)/follow") { (actionResponse: ActionResponse?, response, error) in
      if let actionResponse = actionResponse {
        success?(actionResponse)
      } else if let error = error {
        failure?(error)
      }
    }
  }
}
