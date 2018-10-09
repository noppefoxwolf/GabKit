//
//  ViewController.swift
//  GabKit
//
//  Created by noppefoxwolf on 10/09/2018.
//  Copyright (c) 2018 noppefoxwolf. All rights reserved.
//

import UIKit
import GabKit

class ViewController: UIViewController {
  let gab = Gab(clientID: "", scopes: .read)
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    let callBackURL = URL(string: "gabkit://success")!
    gab.authorize(with: callBackURL, presentingFrom: self)
  }
}

