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

// MARK: - DataClass
struct DataClass: Codable {
    let id: Int
    let username: String
    let profilePictureURL: String
    let banks: [Bank]

    enum CodingKeys: String, CodingKey {
        case id, username
        case profilePictureURL = "profilePictureUrl"
        case banks = "Banks"
    }
}

// MARK: - Bank
struct Bank: Codable {
    let bankName: String
    let balance: Int
}
