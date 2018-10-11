//
//  Gab+Notifications.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/10.
//

import Foundation

extension Gab {
  public func getNotifications(before notificationID: String? = nil, success: NotificationsSuccess? = nil, failure: Failure? = nil) {
    var params: [String : String?] = [:]
    if let id = notificationID {
      params["before"] = id
    }
    get(path: "notifications", params: params) { (notifications: NotificationsResponse?, response, error) in
      if let notifications = notifications {
        success?(notifications)
      } else if let error = error {
        failure?(error)
      }
    }
  }
}
