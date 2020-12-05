//
//  MsViewController.swift
//  iOS_Design_Collaboration_Team1
//
//  Created by 선민승 on 2020/11/14.
//

import UIKit

class MsViewController: UIViewController {
  
  @IBOutlet var userName: UILabel!
  @IBOutlet var userImage: UIImageView!
  @IBOutlet var assetLabel: UILabel!
  @IBOutlet var numberLabel: UILabel!
  @IBOutlet var postView: UIView!
  @IBOutlet weak var assetTableView: UITableView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    initLayout()
    postViewAutoLayout()
    
  }
  
  
  func initLayout(){
    self.view.backgroundColor = UIColor.mainBlue
    self.userName.textColor = .white
    self.userImage.layer.cornerRadius = 30
    self.userImage.image = UIImage(named: "userImage")
    self.assetLabel.textColor = UIColor.white80
    self.numberLabel.textColor = UIColor.backgroundWhite
    self.postView.backgroundColor = UIColor.paleGrey
    self.postView.layoutIfNeeded()
    self.postView.roundedTop()
    
  }
  
  func postViewAutoLayout() {
    
  }
  
  
  
}



