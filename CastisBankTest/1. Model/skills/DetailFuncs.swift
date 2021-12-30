//
//  DetailFuncs.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/13.
//
import Foundation
import UIKit

class DetailFuncs {
    
    // 돈 단위를 천 단위로 끊어서 표시하는 함수
    func makeMoneyAmountEasy(amount: Int) -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let balance = numberFormatter.string(from: NSNumber(value: amount))
        let balanceString = String(balance!) + "원"
        
        return balanceString
    }
    
    func makeStringDoubleToInt(string: String) -> Int{
        return Int(Double(string) ?? 0.0)
    }
    
    func makeDate(fullDate: String) -> Substring {
        let date = fullDate.dropFirst(5).prefix(5) as Substring
        return date
    }
    
    func typeInKorean(type: String) -> String {
        switch type{
        case "Internal":
            return "내부이체"
        case "External":
            return "외부이체"
        case "salary":
            return "급여이체"
        default:
            return " "
        }
    }
}
