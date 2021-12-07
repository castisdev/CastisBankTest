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

public struct User {
    var userName: String
}

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


public struct UsedHistory {
    
    var usedDate: String
    var receivedAccount: String
    var usedMondy: String
    var balance: String
    
    init(usedDate: String, recevedAccount: String, usedMoney: String, balance: String) {
        self.usedDate = usedDate
        self.receivedAccount = recevedAccount
        self.usedMondy = usedMoney
        self.balance = balance
    }
}


//이건 쓸지도..?
public struct SearchInfo{
    var searchStandard: String
    var standards: [String]
    
    init(searchStandard: String, standards: [String]){
        self.searchStandard = searchStandard
        self.standards = standards
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
    
    let userInformation: User = User(userName: "탁제원")
    
    let usedInformation: [UsedHistory] = [
        UsedHistory(usedDate: "11.05", recevedAccount: "홍길동", usedMoney: "10,000원", balance: "0원"),
        UsedHistory(usedDate: "11.04", recevedAccount: "전정국", usedMoney: "3,990,000원", balance: "10,000원"),
        UsedHistory(usedDate: "11.04", recevedAccount: "김태형", usedMoney: "100,000", balance: "4,000,000원"),
        UsedHistory(usedDate: "11.04", recevedAccount: "김태형", usedMoney: "100,000", balance: "4,000,000원"),
        UsedHistory(usedDate: "11.04", recevedAccount: "김태형", usedMoney: "100,000", balance: "4,000,000원"),
        UsedHistory(usedDate: "11.04", recevedAccount: "김태형", usedMoney: "100,000", balance: "4,000,000원"),
        UsedHistory(usedDate: "11.04", recevedAccount: "김태형", usedMoney: "100,000", balance: "4,000,000원"),
        UsedHistory(usedDate: "11.05", recevedAccount: "홍길동", usedMoney: "10,000원", balance: "0원"),
        UsedHistory(usedDate: "11.04", recevedAccount: "전정국", usedMoney: "3,990,000원", balance: "10,000원"),
        UsedHistory(usedDate: "11.04", recevedAccount: "김태형", usedMoney: "100,000", balance: "4,000,000원"),
        UsedHistory(usedDate: "11.04", recevedAccount: "김태형", usedMoney: "100,000", balance: "4,000,000원"),
        UsedHistory(usedDate: "11.04", recevedAccount: "김태형", usedMoney: "100,000", balance: "4,000,000원"),
        UsedHistory(usedDate: "11.04", recevedAccount: "김태형", usedMoney: "100,000", balance: "4,000,000원"),
        UsedHistory(usedDate: "11.04", recevedAccount: "김태형", usedMoney: "100,000", balance: "4,000,000원"),

    ]
    
    let searchInfo: [SearchInfo] = [
        SearchInfo(searchStandard: "조회기간", standards: ["1개월", "3개월", "지난달", "직접설정"]),
        SearchInfo(searchStandard: "거래 유형", standards: ["전체", "입금만", "출금만"]),
        SearchInfo(searchStandard: "거래내역정렬", standards: ["최신순", "과거순"])
    ]

}
//
//class MonthIndex(month: String){ () -> Int in
//    
//    switch(month){
//    case "1개월":
//        return 0
//    case "3개월":
//        return 1
//    case "지난달":
//        return 2
//    case "직접설정":
//        return 3
//    default:
//        return 0
//    }
//    
//}

