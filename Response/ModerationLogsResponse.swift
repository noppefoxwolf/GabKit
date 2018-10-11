//
//  ModerationLogsResponse.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/12.
//

import Foundation

public class ModerationLogsResponse: Decodable {
  public let data: [ModerationLog]
}
