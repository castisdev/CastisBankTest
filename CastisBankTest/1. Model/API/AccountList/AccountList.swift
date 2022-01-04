//
//  AccountList.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/09.
//

import Foundation

//참조 : https://app.quicktype.io (자동으로 json을 codable로 바꿔줌)
struct AccountList: Codable{
    var id, type, branchName, name: String
    var currency, password: String
    var balance, createDate: Int
}

