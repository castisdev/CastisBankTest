//
//  ControlEnums.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/08.
//

import Foundation


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
