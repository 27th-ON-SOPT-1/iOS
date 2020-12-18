//
//  MsData.swift
//  iOS_Design_Collaboration_Team1
//
//  Created by 노한솔 on 2020/12/17.
//

import Foundation


struct GenericResponse: Codable {
    var status: Int
    var success: Bool
    var message: String
    var data: DataClass
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case success = "success"
        case message = "message"
        case data = "data"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(DataClass.self, forKey: .data)) ?? DataClass.init(id: 1, username: "err", profilePictureURL: "err", banks: [Bank.init(bankName: "err", balance: 0)])
        //dataclass intializing이 필요함 
    }
}

