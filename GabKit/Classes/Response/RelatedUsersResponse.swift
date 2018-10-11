//
//  RelatedUsersResponse.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/12.
//

import Foundation

public class RelatedUsersResponse: Decodable {
  public let data: [RelatedUserDetail]
  public let count: Int
  //public let no-more: Bool
}