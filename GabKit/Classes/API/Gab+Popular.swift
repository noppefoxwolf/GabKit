//
//  Gab+Popular.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/10.
//

import Foundation

extension Gab {
  public func getPopularFeed(success: FeedSuccess? = nil,
                             failure: Failure? = nil) {
    get(path: "popular/feed") { (feedResponse: FeedResponse?, response, error) in
      if let feedResponse = feedResponse {
        success?(feedResponse)
      } else if let error = error {
        failure?(error)
      }
    }
  }
  
  public func getPopularUsers(success: UsersSuccess? = nil,
                              failure: Failure? = nil) {
    get(path: "popular/users") { (usersResponse: UsersResponse?, response, error) in
      if let usersResponse = usersResponse {
        success?(usersResponse)
      } else if let error = error {
        failure?(error)
      }
    }
  }
}
