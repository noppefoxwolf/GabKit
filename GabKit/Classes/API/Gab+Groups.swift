//
//  Gab+Groups.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/10.
//

import Foundation

extension Gab {
  public func getPopularGroups(success: GroupsSuccess? = nil, failure: Failure? = nil) {
    get(path: "groups") { (groups: GroupsResponse?, response, error) in
      if let groups = groups {
        success?(groups)
      } else if let error = error {
        failure?(error)
      }
    }
  }
  
  public func getGroupDetails(groupID: String, success: GroupDetailSuccess? = nil, failure: Failure? = nil) {
    get(path: "groups/\(groupID)") { (group: GroupDetail?, response, error) in
      if let group = group {
        success?(group)
      } else if let error = error {
        failure?(error)
      }
    }
  }
  
  public func getGroupUsers(groupID: String, before: Int? = nil, success: UsersSuccess? = nil, failure: Failure? = nil) {
    var params: [String : String?] = [:]
    if let before = before {
      params["before"] = "\(before)"
    }
    get(path: "groups/\(groupID)/users", params: params) { (users: UsersResponse?, response, error) in
      if let users = users {
        success?(users)
      } else if let error = error {
        failure?(error)
      }
    }
  }
  
  public func getGroupModerationLogs(groupID: String, success: ModerationLogsSuccess? = nil, failure: Failure? = nil) {
    get(path: "groups/\(groupID)/moderation-logs") { (logs: ModerationLogsResponse?, response, error) in
      if let logs = logs {
        success?(logs)
      } else if let error = error {
        failure?(error)
      }
    }
  }
}
