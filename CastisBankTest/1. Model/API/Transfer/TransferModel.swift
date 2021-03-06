//
//  TransferModel.swift
//  CastisBankTest
//
//  Created by 탁제원 on 2021/12/21.
//

import Foundation

protocol TransferDelegate{
    func TransferRetrieved(transferResult: TransferResult)
}

class TransferModel{
    
    var delegate: TransferDelegate?
    
    func askTransfer(userId: String, sendAccountId: String, recvAccountId: String, amount: Int, transferHistory: String, otp: String, memo: String){
        
        let ask = TransferBody(userId: userId, sendAccountId: sendAccountId, recvAccountId: recvAccountId, amount: amount, transferHistory: transferHistory, otp: otp, memo: memo)
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        guard let uploadData = try? encoder.encode(ask) else {
            return print("fail to encode transfer body")
        }
        
        print("transfer result: ",String(data: uploadData, encoding: .utf8)!)
        
        let urlString = "http://110.35.173.101/cbank/api/v1/transfer"
        let url = URL(string: urlString)
        
        guard url != nil else{
            return print("error: fail to create url object for transfer")
        }
        
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = uploadData
        request.addValue("application/json", forHTTPHeaderField: "Content-type")
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            print("transfer result: ",String(data: data!, encoding: .utf8)!)
            if error == nil && data != nil {
                
                let decoder = JSONDecoder()
                
                do {
                    let transferResponse = try decoder.decode(TransferResult.self, from: data!)
                    
                    DispatchQueue.main.async {
                        self.delegate?.TransferRetrieved(transferResult: transferResponse)
                    }
                    
                } catch {
                    print("Error : parsing the json")
                }
            }
            
        }
        
        dataTask.resume()
    }
}
