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
  
    @IBOutlet var cellHeaderLabel: UILabel!
    
    var accountList:[Account] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initLayout()
        setAccountData()
        assetTableView.dataSource=self
        assetTableView.separatorStyle=UITableViewCell.SeparatorStyle.none
        self.navigationController?.isNavigationBarHidden = true

    }
    
    
    func initLayout(){
        self.view.backgroundColor = UIColor.mainBlue
        self.userName.textColor = .white
        self.cellHeaderLabel.textColor = UIColor.blackTwo
        self.userImage.layer.cornerRadius = 30
        self.userImage.image = UIImage(named: "userImage")
        self.assetLabel.textColor = UIColor.white80
        self.numberLabel.textColor = UIColor.backgroundWhite
        self.postView.backgroundColor = UIColor.paleGrey
        self.postView.layoutIfNeeded()
        self.postView.roundedTop()
        
    }
    
    func setAccountData() {
        accountList.append(contentsOf: [
            Account(name: "은행명", amount: "20,000원", accountImageName: "icBank")
        ])
    }
    
}

extension MsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AccountTableViewCell") as?
                
                AccountTableViewCell else {
            
            return UITableViewCell()
        }
//        cell.setCell(rank: indexPath.row, music: musicRank[indexPath.row])
        return cell
    }
    
}


