//
//  Attachment.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/10.
//

import Foundation

public class Attachment: Decodable {  
  public let type: AttachmentType?
  public let value: AttachmentObject?
}
