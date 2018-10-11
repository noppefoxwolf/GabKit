//
//  KeyDecodingStrategy.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/12.
//

import Foundation

extension JSONDecoder.KeyDecodingStrategy {
  static var convertFromSnakeCaseOrKebabCase: JSONDecoder.KeyDecodingStrategy {
    return .custom({ (codingKeys) -> CodingKey in
      let key = codingKeys.last!.stringValue.camelCase
      return GabCodingKey(stringValue: String(key), intValue: Int(key))
    })
  }
}

struct GabCodingKey : CodingKey {
  var stringValue: String
  var intValue: Int?
  
  init(_ base: CodingKey) {
    self.init(stringValue: base.stringValue, intValue: base.intValue)
  }
  
  init(stringValue: String) {
    self.stringValue = stringValue
  }
  
  init(intValue: Int) {
    self.stringValue = "\(intValue)"
    self.intValue = intValue
  }
  
  init(stringValue: String, intValue: Int?) {
    self.stringValue = stringValue
    self.intValue = intValue
  }
}

