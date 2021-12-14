//
//  AccountHistoryList.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/14.
//

import Foundation

struct AccountHistoryList: Codable{
    var id, type, sendName, sendAccount: String
    var recvName, recvAccount, history, amount: String
    var balance, date, status, memo: String
}
