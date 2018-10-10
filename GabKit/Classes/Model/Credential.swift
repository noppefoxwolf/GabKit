//
//  Credential.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/11.
//

import Foundation

internal class Credential: Decodable {
  internal let tokenType: String
  internal let expiresIn: Int
  internal let accessToken: String
  internal let refreshToken: String
}
