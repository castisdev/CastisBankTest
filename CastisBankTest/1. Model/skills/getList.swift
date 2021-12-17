//
//  getList.swift
//  CastisBankTest
//
//  Created by 탁제원 on 2021/12/17.
//
//
//import Foundation
//import UIKit
//
//protocol getListDelegate {
//    func getListWithOTP(list: [AccountHistoryList])
//}
//
//class getList{
//    
//    var retrievedOTP: OTPResult?
//    var otpModel = OTPModel()
//    
//    func getOtp(user: String, viewController: OTPModelDelegate){
//        
//        otpModel.delegate = viewController
//        otpModel.getOTP(userId: user, companyId: "talkis_app")
//        
//        return retrievedOTP!
//    }
//    
//}
//
//extension getList: OTPModelDelegate {
//    func OTPRetrieved(otpResult: OTPResult) {
//        retrievedOTP = otpResult
//    }
//}
