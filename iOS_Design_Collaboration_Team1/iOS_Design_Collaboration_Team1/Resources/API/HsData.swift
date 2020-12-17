//
//  HsData.swift
//  iOS_Design_Collaboration_Team1
//
//  Created by 노한솔 on 2020/12/17.
//

import Foundation

struct ProductsData : Codable{
  var status : Int
  var success:Bool
  var message : String
  var data : [T]?
  
  enum CodingKeys:String, CodingKey {
    case status = "status"
    case success = "success"
    case message = "message"
    case data = "data"
  }
  init(from decoder: Decoder) throws{
    let values = try decoder.container(keyedBy: CodingKeys.self)
    status = (try? values.decode(Int.self, forKey: .status)) ?? -1
    success = (try? values.decode(Bool.self, forKey: .success)) ?? false
    message = (try? values.decode(String.self, forKey: .message)) ?? ""
    data = (try? values.decode([T].self, forKey: .data)) ?? [T.init(id: 1, productName: "", subtitle: "", productImageUrl: "")]
  }
}

struct T: Codable {
    let id: Int
    let productName, subtitle: String
    let productImageUrl: String

    enum CodingKeys: String, CodingKey {
        case id, productName, subtitle
        case productImageUrl = "productImageUrl"
    }
}


