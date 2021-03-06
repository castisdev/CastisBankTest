//
//  OTPModel.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/14.
//

import Foundation

protocol OTPModelDelegate{
    func OTPRetrieved(otpResult: OTPResult)
}

class OTPModel{
    
    var delegate: OTPModelDelegate?
    
    func getOTP(userId: String, companyId: String){
        
        let ask = OTPBody(userId: userId, companyId: companyId)
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        guard let uploadData = try? encoder.encode(ask) else {
            return print("fail to encode otp body")
        }
        
        print("encoded body is ", String(data: uploadData, encoding: .utf8)!)
        
        let urlString = "http://110.35.173.101/cbank/api/v1/otp"
        let url = URL(string: urlString)
        
        guard url != nil else {
            print("error: fail to create url object")
            return
        }
        
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = uploadData
        request.addValue("application/json", forHTTPHeaderField: "Content-type")
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request){ (data, response, error) in
            
            if error == nil && data != nil {
                print("with have a data before decoding: ",String(data: data!, encoding: .utf8)!)
                let decoder = JSONDecoder()
                do {
                    let otpInfo = try decoder.decode(OTPResult.self, from: data!)
                    
                    print("otpEncoded : ",otpInfo)
                    DispatchQueue.main.async {
                        self.delegate?.OTPRetrieved(otpResult: otpInfo)
                    }
                }
            catch {
                print("////////otp Error: parsing the json")
            }
            
        }
    }
    dataTask.resume()
        
    }
}
