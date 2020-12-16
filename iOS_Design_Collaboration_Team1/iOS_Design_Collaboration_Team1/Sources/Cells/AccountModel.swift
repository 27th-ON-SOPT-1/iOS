//
//  AccountModel.swift
//  iOS_Design_Collaboration_Team1
//
//  Created by 선민승 on 2020/12/12.
//

import Foundation
import UIKit

struct Account {
    var name: String
    var amount: String
    var accountImageName: String
    
    func makeAlbumImage() -> UIImage? {
        return UIImage(named: accountImageName)
    }
}
