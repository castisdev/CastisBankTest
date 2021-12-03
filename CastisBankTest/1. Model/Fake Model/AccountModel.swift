//
//  fakeAccountModel.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/03.
//

import UIKit

//size도 컬러칩처럼?
//order에 따라 별 상태

let colorchip = ColorChip()

public struct AccountSpecs {
    
    var accountName: String
    var accountNum: String
    var accountBalance: String
    
    var cellBackgroundColor: UIColor
    var mainStatus: Bool
    
    init(accountName: String, accountNum: String, accountBalance: String, cellBackgroundColor: UIColor, mainStatus: Bool) {
        self.accountName = accountName
        self.accountNum = accountNum
        self.accountBalance = accountBalance
        
        self.cellBackgroundColor = cellBackgroundColor
        self.mainStatus = mainStatus
    }
}

public struct AccountModel {
    
    let mainCellInformation: [AccountSpecs] = [
        AccountSpecs(accountName: "탁제원 주계좌", accountNum: "1234-5678", accountBalance: "123,456원", cellBackgroundColor: colorchip.kakaoYello, mainStatus: true),
        AccountSpecs(accountName: "탁제원 2계좌", accountNum: "123434-121468", accountBalance: "56원", cellBackgroundColor: colorchip.kakaoPink, mainStatus: false),
        AccountSpecs(accountName: "탁제원 3계좌", accountNum: "15434-12156468", accountBalance: "12,345,020원", cellBackgroundColor: colorchip.kakaoBlue, mainStatus: false),
        AccountSpecs(accountName: "탁제원 3계좌", accountNum: "15434-12156468", accountBalance: "12,345,020원", cellBackgroundColor: colorchip.kakaoYello, mainStatus: false),
        AccountSpecs(accountName: "탁제원 3계좌", accountNum: "15434-12156468", accountBalance: "12,345,020원", cellBackgroundColor: colorchip.kakaoYello, mainStatus: false)
    ]
}
