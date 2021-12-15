//
//  AccountHistoryModel.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/14.
//

import Foundation

protocol AccountHistoryDelegate{
    func accountHistoryRetrieved(histories: [AccountHistoryList])
}

class AccountHistoryModel{
    var delegate: AccountHistoryDelegate?
    
    func getAccountHistory(userId: String, accountId: String, duration: String, otp: String){
        
        let ask = AccountHistoryBody(userId: userId, accountId: accountId, duration: duration, otp: otp)
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        guard let accountHistoryBody = try? encoder.encode(ask) else {
            return print("error : encoding the account history body")

        }
//        print(String(data: accountHistoryBody, encoding: .utf8)!)
        
        let urlString = "http://172.16.48.201/cbank/api/v1/account/history"
        let url = URL(string: urlString)
        
        guard url != nil else {
            return print("error: fail to create url object")
        }
        
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = accountHistoryBody
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request){ (data, response, error) in
            
            if error == nil && data != nil {
                
                print("account transfer list : ",String(data: data!, encoding: .utf8)!)
                let decoder = JSONDecoder()
                
                do {
                    let accountService = try decoder.decode(AccountHistoryService.self, from: data!)
                    
                    DispatchQueue.main.sync {
                        self.delegate?.accountHistoryRetrieved(histories: accountService.history)
//                        print(accountService.history)
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
