//
//  NotificationsResponse.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/12.
//

import Foundation

public class NotificationsResponse: Codable {
  public let data: [Notification]
  public let noMore: Bool
}
