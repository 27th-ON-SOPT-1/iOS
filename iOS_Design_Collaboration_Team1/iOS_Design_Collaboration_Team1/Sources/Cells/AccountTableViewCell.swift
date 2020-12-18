//
//  AccountTableViewCell.swift
//  iOS_Design_Collaboration_Team1
//
//  Created by 선민승 on 2020/12/12.
//

import UIKit

class AccountTableViewCell: UITableViewCell {
    static let identifer = "AccountTableViewCell"
    
    @IBOutlet var icListbox: UIImageView!
    
    @IBOutlet var amountLabel: UILabel!
    @IBOutlet var icBank: UIImageView!
    @IBOutlet var bankNameLabel: UILabel!
   
    @IBOutlet var boxLeading: NSLayoutConstraint!
    @IBOutlet var boxTrailing: NSLayoutConstraint!

    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        

        // Initialization code
        let screenHeight = UIScreen.main.bounds.height

        self.boxLeading.constant = 29/896*screenHeight
        self.boxTrailing.constant = 29/896*screenHeight

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//        icListbox.image = UIImage(named: "icBank")
        amountLabel.text = "20,000원"
        bankNameLabel.text = "은행명"

    }
    

//    override func layoutSubviews() {
//          super.layoutSubviews()
//          //set the values for top,left,bottom,right margins
//          let margins = UIEdgeInsets(top: 30, left: 10, bottom: 30, right: 10)
//          contentView.frame = contentView.frame.inset(by: margins)
//          contentView.layer.cornerRadius = 8
//    }
}

