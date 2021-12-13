//
//  DetailFuncs.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/13.
//
import Foundation

class DetailFuncs {
    
    // 돈 단위를 천 단위로 끊어서 표시하는 함수
    func makeMoneyAmountEasy(amount: Int) -> String{
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let balance = numberFormatter.string(from: NSNumber(value: amount))
        let balanceString = String(balance!) + "원"
        
        return balanceString
    }
}
