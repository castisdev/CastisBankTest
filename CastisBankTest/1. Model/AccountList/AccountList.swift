//
//  AccountList.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/09.
//

import Foundation

//참조 : https://app.quicktype.io (자동으로 json을 codable로 바꿔줌)
struct AccountList: Codable {
    var id, type, branchName, name: String
    var currency, password: String
    var balance, createDate: Int
}

////참조 : https://velog.io/@altmshfkgudtjr/Swift로-API-Request를-전송하기
//func requestAccountList() {
//    
//    let urlString = "http://172.16.48.201/cbank/api/v1/accounts/test1"
//    
//    guard let url = URL(string: urlString) else {
//        print("Error: cannot create URL")
//        return
//    }
//
//    let request = URLRequest(url: url)
////    request.httpMethod = "GET"
//
//    URLSession.shared.dataTask(with: request){ data, response, error in
//
//        guard error == nil else {
//            print("Error: error calling GET")
//            print(error!)
//            return
//        }
//
//        guard let data = data else {
//            print("Error: Did not receve data")
//            return
//        }
//    
////        print(String(data: data, encoding: .utf8)!)
//
//        guard let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode else {
//            print("Error: HTTP request failed")
//            return
//        }
//
//        guard let output: [AccountList] = try? JSONDecoder().decode([AccountList].self, from: data) else {
//            print("Error: JSON Data Parsing failed")
//            return
//        }
//        print(output)
//        print(output[0].name)
//        
//    }.resume()
//    
//}
