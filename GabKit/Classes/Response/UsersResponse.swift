//
//  UsersResponse.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/12.
//

import Foundation

public class UsersResponse: Codable {
  public let data: [User]
  public let noMore: Bool
}
