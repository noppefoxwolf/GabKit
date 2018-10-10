//
//  ComposeViewController.swift
//  GabKit_Example
//
//  Created by Tomoya Hirano on 2018/10/11.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

protocol ComposeViewControllerDelegate: class {
  func didCanceled(_ viewController: ComposeViewController)
  func composeViewController(_ viewController: ComposeViewController, didSelectSendButton: UIBarButtonItem)
}

final class ComposeViewController: UIViewController {
  static func make() -> ComposeViewController {
    return UIStoryboard(name: "ComposeViewController", bundle: nil).instantiateInitialViewController() as! ComposeViewController
  }
  
  @IBOutlet private weak var textView: UITextView!
  weak var delegate: ComposeViewControllerDelegate? = nil
  var body: String { return textView.text }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let right = UIBarButtonItem(title: "Send", style: .done, target: self, action: #selector(tappedSendButton))
    navigationItem.rightBarButtonItem = right
    
    let left = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(tappedCancelButton))
    navigationItem.leftBarButtonItem = left
  }
  
  @objc private func tappedSendButton(_ sender: UIBarButtonItem) {
    delegate?.composeViewController(self, didSelectSendButton: sender)
  }
  
  @objc private func tappedCancelButton(_ sender: UIBarButtonItem) {
    delegate?.didCanceled(self)
  }
}
