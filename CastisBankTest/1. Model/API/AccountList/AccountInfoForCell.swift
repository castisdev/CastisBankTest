//
//  accountInfoForCell.swift
//  CastisBankTest
//
//  Created by 탁제원 on 2022/01/04.
//

import Foundation
import UIKit
//
//class AccountInfoForCell: NSObject, NSCoding{
//    func encode(with coder: NSCoder) {
//        return
//    }
//
//    let accountName: String
//    let accountNumber: String
//    let accountBalance: String
//    let accountColor: UIColor
//
//    init(accountName: String, accountNumber: String, accountBalance: String, accountColor: UIColor){
//        self.accountName = accountName
//        self.accountNumber = accountNumber
//        self.accountBalance = accountBalance
//        self.accountColor = accountColor
//    }
//
//    required convenience init?(coder decoder: NSCoder) {
//        guard let accountName = decoder.decodeObject(forKey: "name") as? String,
//              let accountNumber = decoder.decodeObject(forKey: "number") as? String,
//              let accountBalance = decoder.decodeObject(forKey: "balance") as? String,
//              let accountColor = decoder.decodeObject(forKey: "color") as? UIColor else {
//                  return nil
//              }
//        self.init(accountName: accountName, accountNumber: accountNumber, accountBalance: accountBalance, accountColor: accountColor)
//    }
//
//
//    func encodeWithCoder(coder: NSCoder){
//        coder.encode(accountName, forKey: "name")
//        coder.encode(accountNumber, forKey: "number")
//        coder.encode(accountBalance, forKey: "balance")
//        coder.encode(accountColor, forKey: "color")
//    }
//
//    static var accountInfoForCell: [AccountInfoForCell]? {
//        get{
//            guard let data = UserDefaults.standard.object(forKey: Keys.)
//        }
//        set {
//
//        }
//    }
//
//}
