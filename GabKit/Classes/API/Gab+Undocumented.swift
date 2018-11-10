//
//  Gab+Undocumented.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/11/11.
//

import Foundation

extension Gab {
  public func _getJoinedGroup(success: GroupsSuccess? = nil, failure: Failure? = nil) {
    get(path: "groups/joined", params: [:]) { (groups: GroupsResponse?, response, error) in
      if let groups = groups {
        success?(groups)
      } else if let error = error {
        failure?(error)
      }
    }
  }
  
  //favorite-feeds
  
  //topics
  public func _getTopics(success: _TopicSuccess? = nil, failure: Failure? = nil) {
    get(path: "topics", params: [:], authorizationMode: .cookie) { (topics: TopicResponse?, response, error) in
      if let topics = topics {
        success?(topics)
      } else if let error = error {
        failure?(error)
      }
    }
  }
  
  //groups/\(group_id)/feed
  //params[sort] = date
  //params[timeframe] = week
  public func _getGroupFeed(groupID: String, success: FeedSuccess? = nil, failure: Failure? = nil) {
    get(path: "groups/\(groupID)/feed", params: [:], authorizationMode: .cookie) { (feed: FeedResponse?, response, error) in
      if let feed = feed {
        success?(feed)
      } else if let error = error {
        failure?(error)
      }
    }
  }
  
  public func _getUserFeed(username: String, success: _UserFeedSuccess? = nil, failure: Failure? = nil) {
    get(path: "feed/\(username)", params: [:], authorizationMode: .cookie) { (feed: _UserFeedResponse?, response, error) in
      if let feed = feed {
        success?(feed)
      } else if let error = error {
        failure?(error)
      }
    }
  }
  
  public func _getUserCommentFeed(username: String, success: _UserFeedSuccess? = nil, failure: Failure? = nil) {
    get(path: "feed/\(username)/comments", params: [:], authorizationMode: .cookie) { (feed: _UserFeedResponse?, response, error) in
      if let feed = feed {
        success?(feed)
      } else if let error = error {
        failure?(error)
      }
    }
  }
}

