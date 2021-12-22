//
//  AccountHistoryBody.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/14.
//

import Foundation

struct AccountHistoryBody: Codable{
    var userId, accountId, duration, startDate, endDate, otp: String
}
