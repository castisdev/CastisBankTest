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
    
    func setSearchPeriod(period: String, startDate: String, endDate: String, now: String) -> [String] {

        
        switch period{
        case "1개월":
            return ["1M", "", ""]
        case "3개월":
            return ["3M", "", ""]
        case "지난달":
            let lastMonthAndYear = setSearchLastMonth(now: now)
            return ["", lastMonthAndYear[0], lastMonthAndYear[1]]
        case "직접설정":
            return ["7M", startDate, endDate]
        default:
            return ["3M", "", ""]
        }
    }
    
    func setSearchLastMonth (now: String) -> [String] {
        
        var lastMonth = ""
        var lastYear = ""
        
        let endDateYear = now.dropFirst(24).prefix(4)
        let endDateMonth = now.dropFirst(4).prefix(3)
        let endDateMonthNum = setMonthToInt(month: String(endDateMonth))
        
        
        print("accepted year and month : ", endDateYear, endDateMonth, ", Int month : ", endDateMonthNum)
        
        if endDateMonth == "Jan"{
            lastMonth = "12"
            lastYear = String(Int(endDateYear)! - 1)
        } else {
            lastMonth = String(Int(endDateMonthNum)! - 1)
            lastYear = String(Int(endDateYear)!)
        }
        
        let startDate = lastYear + lastMonth + "01"
        var endDate = lastYear + lastMonth + "31"
        
        switch lastMonth{
            
        case "1","3","5","7","8","10", "12":
            endDate = lastYear + lastMonth + "31"
        case "4", "6", "9", "11":
            endDate = lastYear + lastMonth + "30"
        case "2":
            let lastYearInt = Int(lastYear)!
            if lastYearInt % 4 == 0 && lastYearInt % 100 != 0 || lastYearInt % 400 == 0{
                endDate = lastYear + lastMonth + "29"
            } else {
                endDate = lastYear + lastMonth + "28"
            }
        default:
            endDate = lastYear + lastMonth + "31"
        }
        return [startDate, endDate]
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
    
    func setMonthToInt(month: String) -> String{
        
        switch month{
        case "Jan":
            return "01"
        case "Feb":
            return "02"
        case "Mar":
            return "03"
        case "Apr":
            return "04"
        case "May":
            return "05"
        case "Jun":
            return "06"
        case "Jul":
            return "07"
        case "Aug":
            return "08"
        case "Sep":
            return "09"
        case "Oct":
            return "10"
        case "Nov":
            return "11"
        case "Dec":
            return "12"
        default:
            return "01"
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
