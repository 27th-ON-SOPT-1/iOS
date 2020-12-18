//
//  MsViewController.swift
//  iOS_Design_Collaboration_Team1
//
//  Created by 선민승 on 2020/11/14.
//

import UIKit

class MsViewController: UIViewController{
  
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
    
    assetTableView.dataSource=self
    
    setAccountData()
    
    assetTableView.delegate=self
    assetTableView.separatorStyle=UITableViewCell.SeparatorStyle.none
    self.navigationController?.isNavigationBarHidden = true
    assetTableView.estimatedRowHeight=120
    
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
    var sum : [Int] = []
    for i in 0..<self.dataList.banks.count {
      sum.append(self.dataList.banks[i].balance)
    }
    self.numberLabel.text = self.decimalFormatter(number: self.sumOfNumber(numbers: sum)!)! + "원"
    
  }
  
  
  var dataList:DataClass = DataClass(id: 1, username: "err", profilePictureURL: "err", banks: [Bank.init(bankName: "err", balance: 0)])
  
  func decimalFormatter(number: Int) -> String? {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    let result = numberFormatter.string(for: number)
    return result
  }
  
  func sumOfNumber(numbers:[Int]) -> Int? {
    var sum = 0
    for i in 0..<numbers.count {
      sum += numbers[i]
    }
    return sum
  }
  
  func checkColor(number:Int) -> CGColor? {
    if number < 0 {
      return CGColor(red: 236/255, green: 93/255, blue: 119/255, alpha: 1)
    }
    else {
      return CGColor(red: 22/255, green: 193/255, blue: 155/255, alpha: 1)
    }
  }
  
  func setAccountData() {
    //원래 파라미터 있으면 () 안에 넣어주깅
    BankService.shared.accountUser(){ NetworkResults in
      switch NetworkResults {
      case .success(let data):
        guard let data = data as? DataClass else {return}
        self.dataList = data //전역변수 dataList에 넣어준다.
        self.userName.text = self.dataList.username
        let imageData = try? Data(contentsOf: URL(string: self.dataList.profilePictureURL)!)
        self.userImage.image = UIImage(data: imageData!)
        self.assetTableView.reloadData()
        
      case .requestError(let message):
        
        guard let message = message as? String else {return}
        let alertViewController = UIAlertController(title: "불러오기 실패", message: message,preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
        alertViewController.addAction(action)
        self.present(alertViewController, animated: true, completion: nil)
      case .pathError: print("path")
      case .serverError: print("serverError")
      case .networkFail: print("networkFail")
      }
    }
    
  }
  
}

extension MsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.dataList.banks.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "AccountTableViewCell") as?
            
            AccountTableViewCell else {
      
      return UITableViewCell()
      
    }
    cell.bankNameLabel.text = self.dataList.banks[indexPath.row].bankName
    cell.amountLabel.text = self.decimalFormatter(number: self.dataList.banks[indexPath.row].balance)
    cell.amountLabel.textColor = UIColor(cgColor: self.checkColor(number: self.dataList.banks[indexPath.row].balance)!)
    
    return cell
  }
  
}

extension MsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 120
  }
}
