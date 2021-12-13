//
//  AccountListModel.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/09.

import Foundation

protocol AccountListModelProtocol {
    func AccountListRetrieved(accounts: [AccountList])
}

class AccountListModel{
    
    var delegate: AccountListModelProtocol?
    
    func getAccountList(user: String) {
        
        //1. url 인스턴스 생성 (nil 검사)
        let urlString = "http://172.16.48.201/cbank/api/v1/accounts/\(user)"
        let url = URL(string: urlString)
        
        guard url != nil else {
            print("error : fail to create url object")
            return
        }
        
        //2. urlSession 만들기 -
        let session = URLSession.shared
        
        //3. dataTasK 만들기 -
        let dataTask = session.dataTask(with: url!){ (data, response, error) in
            
            if error == nil && data != nil {
                let decoder = JSONDecoder()
                
                do {
                    let accountList = try decoder.decode([AccountList].self, from: data!)
//                    print(accountList)
                    DispatchQueue.main.sync {
                        self.delegate?.AccountListRetrieved(accounts: accountList)
                    }
                }
                catch {
                    print("Error: parsing the json")
                }
            }
            
        }
        
        dataTask.resume()
        
        
    }
}
