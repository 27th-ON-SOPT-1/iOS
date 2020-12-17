//
//  HsServices.swift
//  iOS_Design_Collaboration_Team1
//
//  Created by 노한솔 on 2020/12/17.
//

import Foundation
import Alamofire


struct ProductService {
  static let shared = ProductService()
  
  func showProducts(completion : @escaping (NetworkResults<Any>) -> Void){
    let header:HTTPHeaders = ["Content-Type":"application/json"]
    let dataRequest = AF.request("http://52.78.212.95:3002/products", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header)
    
    
    dataRequest.responseData { dataResponse in
      switch dataResponse.result {
      case .success:
        guard let statusCode = dataResponse.response?.statusCode else{return}
        guard let value = dataResponse.value else {return}
        let networkResult = judge(by: statusCode, value)
        completion(networkResult)
      case .failure: completion(.networkFail)
      }
    }
    
  }
}
func isUser(by data: Data) -> NetworkResults<Any> {
  let decoder = JSONDecoder()
  guard let decodedData = try? decoder.decode(ProductsData.self, from: data) else { return .pathError }
  guard let tokenData = decodedData.data else { return .requestError(decodedData.message) }
  return .success(tokenData)
}
func judge(by statusCode: Int, _ data: Data) -> NetworkResults<Any> {
  switch statusCode {
  case 200: return isUser(by: data)
  case 400: return .pathError
  case 500: return .serverError
  default: return .networkFail
    
  }
}
