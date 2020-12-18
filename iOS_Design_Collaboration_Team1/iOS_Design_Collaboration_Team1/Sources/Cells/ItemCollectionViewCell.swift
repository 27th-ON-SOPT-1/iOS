//
//  ItemCollectionViewCell.swift
//  iOS_Design_Collaboration_Team1
//
//  Created by 노한솔 on 2020/12/03.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
  // MARK: - Properties
  let identifier = "ItemCollectionViewCell"
  
  // MARK: - IBOutlets
  @IBOutlet weak var mainNameLabel: UILabel!
  @IBOutlet weak var subLabel: UILabel!
  @IBOutlet weak var itemImageView: UIImageView!
  @IBOutlet weak var backImageView: UIImageView!
  @IBOutlet weak var applyButton: UIButton!
  
  // MARK: - Functions
  func setImage(imageName: String) {
    itemImageView.image = UIImage(named: imageName)
  }
  func setImg(imageURL: String) {
    let data = try? Data(contentsOf: URL(string: imageURL)!)
    itemImageView.image = UIImage(data: data!)
  }
  
  func setItemCell(productName: String, subtitle: String, imageURL: String) {
    let data = try? Data(contentsOf: URL(string: imageURL)!)
    self.mainNameLabel.text = productName
    self.subLabel.text = subtitle
    self.itemImageView.image = UIImage(data: data!)
  }
  
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
  
}
