//
//  String+Extensions.swift
//  GabKit
//
//  Created by Tomoya Hirano on 2018/10/12.
//

import Foundation

extension String {
  public var camelCase: String {
    return self.replacingOccurrences(of: "-", with: "_")
               .components(separatedBy: "_")
               .enumerated()
               .map { 0 == $0 ? $1 : $1.capitalized }
               .joined()
    
  }
}
