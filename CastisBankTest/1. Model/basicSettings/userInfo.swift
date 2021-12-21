//
//  userInfo.swift
//  CastisBankTest
//
//  Created by 탁제원 on 2021/12/21.
//

import Foundation

class UserInformation{
    
    public struct UserInfo{
        var userName: String
        var companyId: String
    
        init(userName: String, companyId: String){
            self.userName = userName
            self.companyId = companyId
        }
    }
    
    let user = UserInfo(userName: "test1", companyId: "talkis_app")
}
