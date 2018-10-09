//
//  AppDelegate.swift
//  GabKit
//
//  Created by noppefoxwolf on 10/09/2018.
//  Copyright (c) 2018 noppefoxwolf. All rights reserved.
//

import UIKit
import GabKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    return true
  }
  func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
    Gab.handleURL(url)
    return true
  }
}

