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
  
  
}
