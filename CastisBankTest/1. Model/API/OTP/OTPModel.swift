//
//  OTPModel.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/14.
//

import Foundation

protocol OTPModelDelegate{
    func OTPRetrieved()
}

class OTPModel{
    var delegate: OTPModelDelegate?
    
    func getOTP(){
        
        let urlString = "http://172.16.48.201/cbank/api/v1/otp"
        let url = URL(string: urlString)
        
        guard url != nil else {
            print("error: fail to create url object")
            return
        }
        
        var request = URLRequest(url: url!)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-type")
    }
}
