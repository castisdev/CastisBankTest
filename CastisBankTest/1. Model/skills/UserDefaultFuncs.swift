//
//  UserDefaultFuncs.swift
//  CastisBankTest
//
//  Created by 탁제원 on 2022/01/05.
//

import Foundation
import UIKit

struct UserDefaultFuncs {
    
    static let key = "accountLists"
    
    static func save(_ value: [AccountList]!){
        UserDefaults.standard.set(try? PropertyListEncoder().encode(value), forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    static func get() -> [AccountList]! {
        var accountLists: [AccountList]!
        
        if let data = UserDefaults.standard.value(forKey: key) as? Data {
            accountLists = try? PropertyListDecoder().decode([AccountList].self, from: data)
            return accountLists!
        } else {
            return accountLists
        }
    }
}

extension UserDefaults{
    func valueExists(forKey key: String) -> Bool {
        return object(forKey: key) != nil
    }
}
