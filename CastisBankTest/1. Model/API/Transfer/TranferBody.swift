//
//  TranferBody.swift
//  CastisBankTest
//
//  Created by 탁제원 on 2021/12/21.
//

import Foundation

struct TransferBody: Codable{
    
    var userID, sendAccountID, recvAccountID: String
    var amount: Int
    var transferHistory, otp, memo: String
    
}
