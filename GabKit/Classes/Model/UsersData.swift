//
//  UsersData.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/11/12.
//

import UIKit

public class UsersData: Codable {
  public let data: [User]
}

extension UsersData: Equatable {
  public static func == (lhs: UsersData, rhs: UsersData) -> Bool {
    guard lhs.data == rhs.data else { return false }
    return true
  }
}
