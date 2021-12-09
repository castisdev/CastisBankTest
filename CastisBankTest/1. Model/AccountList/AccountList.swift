//
//  AccountList.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/09.
//

import Foundation

struct AccountList: Codable {
    var id: String?
    var type: String?
    var branchName: String?
    var name: String?
    var currency: String?
    var password: String?
    var balance: Double?
    var createDate: Int?
}

//참조 : https://velog.io/@altmshfkgudtjr/Swift로-API-Request를-전송하기
func requestAccountList() {
    
    let urlString = "http://172.16.48.201/cbank/api/v1/accounts/test1"
    
    guard let url = URL(string: urlString) else {
        print("Error: cannot create URL")
        return
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    URLSession.shared.dataTask(with: request){ data, response, error in
        
        guard error == nil else {
            print("Error: error calling GET")
            print(error!)
            return
        }
        
        guard let data = data else {
            print("Error: Did not receve data")
            return
        }
        
        guard let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode else {
            print("Error: HTTP request failed")
            return
        }
        
        guard let output = try? JSONDecoder().decode(AccountList.self, from: data) else {
            print("Error: JSON Data Parsing failed")
            return
        }
        
    }.resume()
}
