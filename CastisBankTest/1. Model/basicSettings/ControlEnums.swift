//
//  ControlEnums.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/08.
//

import Foundation

class FilterModel{
    
    public struct SearchInfo{
        var searchStandard: String
        var standards: [String]
    
        init(searchStandard: String, standards: [String]){
            self.searchStandard = searchStandard
            self.standards = standards
        }
    }
    
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
            return "12M"
        case "직접설정":
            return "7M"
        default:
            return "3M"
        }
    }
    
    func setSearchType(type: String, list: [AccountHistoryList], accountNum: String) -> [AccountHistoryList]{
        
        var depositList = [AccountHistoryList]()
        var withdrawList = [AccountHistoryList]()
        
        print("List count : ", list.count)
        if list.count != 0{
            for l in 0...(list.count - 1){
                if list[l].recvAccount == accountNum {
                    depositList.append(list[l])
                } else if list[l].sendAccount == accountNum {
                    withdrawList.append(list[l])
                }
            }
        }
        
        switch type{
        case "전체":
            return list
        case "입금만":
            return depositList
        case "출금만":
            return withdrawList
        default:
            return list
        }
    }
    
    
    func setSearchOrder(order: String, list: [AccountHistoryList]) -> [AccountHistoryList]{
        switch order{
        case "최신순":
            return list.reversed()
        case "과거순":
            return list
        default:
            return list.reversed()
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
