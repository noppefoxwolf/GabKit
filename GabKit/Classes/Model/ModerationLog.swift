//
//  ModerationLog.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/12.
//

import Foundation

public class ModerationLog: Codable {
  public let id: String
  public let createdAt: Date
  public let type: String
  public let readableType: String
  public let affectedUser: User
  public let actor: User
}
