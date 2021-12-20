//
//  ControlEnums.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/08.
//

import Foundation

class FilterModel{
    
    let searchInfo: [SearchInfo] = [
        SearchInfo(searchStandard: "조회기간", standards: ["1개월", "3개월", "지난달", "직접설정"]),
        SearchInfo(searchStandard: "거래 유형", standards: ["전체", "입금만", "출금만"]),
        SearchInfo(searchStandard: "거래내역정렬", standards: ["최신순", "과거순"])
    ]
    
    func setSearchPeriod(period: String) -> String{
        switch period{
        case "1개월":
            return "1M"
        case "3개월":
            return "3M"
        case "지난달":
            return "5M"
        case "직접설정":
            return "7M"
        default:
            return "3M"
        }
    }
}


//조회기간
enum SettingPeriod: Int{
    case month1 = 0
    case month3 = 1
    case lastMonth = 2
    case customMonth = 3
}

enum TradeType: Int {
    case whole = 0
    case deposit = 1
    case withdrawal = 2
}

enum TradyOrder: Int{
    case recentOrder = 0
    case pastOrder = 1
}
