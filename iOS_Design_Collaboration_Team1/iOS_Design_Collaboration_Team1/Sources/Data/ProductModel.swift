//
//  ProductModel.swift
//  iOS_Design_Collaboration_Team1
//
//  Created by 노한솔 on 2020/12/17.
//

import Foundation

struct ProductModel {
  var id : Int
  var productName, subtitle, productImageUrl : String
  
 
  init(id : Int, productName: String, subtitle: String, productImageUrl: String) {
    self.id = id
    self.productName = productName
    self.subtitle = subtitle
    self.productImageUrl = productImageUrl
  }

}
