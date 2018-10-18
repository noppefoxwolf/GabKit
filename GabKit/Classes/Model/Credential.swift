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
