//
//  NetworkResults.swift
//  iOS_Design_Collaboration_Team1
//
//  Created by 노한솔 on 2020/12/17.
//

import Foundation

enum NetworkResults<T> {
  case success(T)
  case requestError(T)
  case pathError
  case serverError
  case networkFail
}
