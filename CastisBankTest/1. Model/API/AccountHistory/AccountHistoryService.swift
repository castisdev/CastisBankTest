//
//  AccountHistoryService.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/14.
//

import Foundation

struct AccountHistoryService: Codable {
    var resultCode, resultMsg, now: String
    var count: Int
    var history: [AccountHistoryList]
}
