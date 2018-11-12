//
//  Credential.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/11.
//

import Foundation

public class Credential: Codable {
  public let tokenType: String
  public let expiresIn: Int
  public let accessToken: String
  public let refreshToken: String
}

extension Credential: Equatable {
  public static func == (lhs: Credential, rhs: Credential) -> Bool {
    guard lhs.tokenType == rhs.tokenType else { return false }
    guard lhs.expiresIn == rhs.expiresIn else { return false }
    guard lhs.accessToken == rhs.accessToken else { return false }
    guard lhs.refreshToken == rhs.refreshToken else { return false }
    return true
  }
}
