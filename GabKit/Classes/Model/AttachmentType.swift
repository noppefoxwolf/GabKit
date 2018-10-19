//
//  AttachmentType.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/16.
//

import Foundation

public enum AttachmentType: String, Decodable {
  case media
  case url
  case giphy
  case youtube
}
