//
//  Gab+Feeds.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/10.
//

import Foundation

extension Gab {
  public func getMainFeed(before: Date? = nil, success: FeedSuccess? = nil, failure: Failure? = nil) {
    var params: [String : String?] = [:]
    if let before = before {
      let formatter = DateFormatter()
      formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
      params["before"] = formatter.string(from: before)
    }
    get(url: "https://api.gab.com/v1.0/feed", params: params) { (feedResponse: FeedResponse?, response, error) in
      if let feedResponse = feedResponse {
        success?(feedResponse)
      } else if let error = error {
        failure?(error)
      } else {
        preconditionFailure()
      }
    }
  }
  
  public func getUserFeed() {
    
  }
}
