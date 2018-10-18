//
//  ViewController.swift
//  GabKit
//
//  Created by noppefoxwolf on 10/09/2018.
//  Copyright (c) 2018 noppefoxwolf. All rights reserved.
//

import UIKit
import GabKit

final class ViewController: UIViewController {
  @IBOutlet private weak var tableView: UITableView!
  private lazy var delegator: TableViewDelegator = .init(with: tableView)
  let gab = Gab(clientID: Secret.clientID,
                clientSecret: Secret.clientSecret,
                scopes: [.read, .notifications, .writePost, .engageUser, .engagePost])
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let left = UIBarButtonItem(title: "Authorize", style: .done, target: self, action: #selector(tappedAuthorizeButton))
    navigationItem.leftBarButtonItem = left
    
    let post = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(tappedComposeButton))
    navigationItem.rightBarButtonItem = post
    
    let refreshControl = UIRefreshControl(frame: .zero)
    refreshControl.addTarget(self, action: #selector(pullToRefreshed), for: .valueChanged)
    tableView.refreshControl = refreshControl
    
    _ = delegator
  }
  
  @objc func tappedAuthorizeButton(_ sender: UIBarButtonItem) {
    gab.authorize(withPresentingFrom: self, success: { [weak self] (_) in
      self?.fetchMainFeed()
    }) { [weak self] (error) in
      DispatchQueue.main.async {
        self?.presentAlert(title: "ERROR", message: error.localizedDescription)
      }
    }
  }
  
  @objc func pullToRefreshed(_ sender: UIRefreshControl) {
    fetchMainFeed()
  }
  
  @objc func tappedComposeButton(_ sender: UIBarButtonItem) {
    let vc = ComposeViewController.make()
    vc.delegate = self
    let nc = UINavigationController(rootViewController: vc)
    present(nc, animated: true, completion: nil)
  }
  
  private func fetchMainFeed() {
    gab.getMainFeed(success: { [weak self] (response) in
      DispatchQueue.main.async {
        self?.delegator.postResponses = response.data
        self?.tableView.reloadData()
        self?.tableView.refreshControl?.endRefreshing()
      }
    }) { [weak self] (error) in
      DispatchQueue.main.async {
        self?.tableView.refreshControl?.endRefreshing()
        self?.presentAlert(title: "ERROR", message: error.localizedDescription)
      }
    }
  }
  
  private func presentAlert(title: String? = nil, message: String? = nil) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(.init(title: "OK", style: .default, handler: nil))
    present(alert, animated: true, completion: nil)
  }
}

extension ViewController: ComposeViewControllerDelegate {
  func didCanceled(_ viewController: ComposeViewController) {
    viewController.dismiss(animated: true, completion: nil)
  }
  
  func composeViewController(_ viewController: ComposeViewController, didSelectSendButton: UIBarButtonItem) {
    viewController.dismiss(animated: true, completion: nil)
    gab.publish(viewController.body, success: { (response) in
      print(response)
    }) { (error) in
      print(error)
    }
  }
}

final class TableViewDelegator: NSObject, UITableViewDelegate, UITableViewDataSource {
  var postResponses: [PostResponse] = []
  
  init(with tableView: UITableView) {
    super.init()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return postResponses.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    let postResponse = postResponses[indexPath.row]
    cell.textLabel?.text = postResponse.post.body
    return cell
  }
}
