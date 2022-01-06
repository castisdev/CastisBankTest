//
//  TransferSuccessViewController.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/02.
//

import UIKit

class TransferSuccessViewController: UIViewController {

    @IBOutlet weak var transferSuccessLabel: UILabel!
    @IBOutlet weak var backToRootButton: UIButton!
    @IBOutlet weak var transferInfoLabel: UILabel!
    
    let uikitFuncs = UIKitFuncs()
    let userInfo = UserInformation().user
    
    let otpModel = OTPModel()
    var otpResult: OTPResult?
    
    let transferModel = TransferModel()
    var transferResult: TransferResult?
    
    let accountListModel = AccountListModel()
    var accountListResult: [AccountList]?
    
    var transferInfo = ["보내는 계좌 번호", "받는 계좌 이름", "받는 계좌 번호", "송금 금액", "메모"]
    
    var savedAccountInfo: [AccountList]?
    let userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        otpModel.delegate = self
        print("-- user info !!", userInfo)
        otpModel.getOTP(userId: userInfo.userName, companyId: userInfo.companyId)
        
        setConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    private func settings(){
        
        if transferResult?.resultCode == "200" {
            
            uikitFuncs.labelSettings(label: transferSuccessLabel, title: "이체 완료!", size: 20, color: .black)
            uikitFuncs.labelSettings(label: transferInfoLabel, title: "", size: 15, color: .black)
        } else {
            
            uikitFuncs.labelSettings(label: transferSuccessLabel, title: "이체 실패..", size: 20, color: .black)
            let errorMessage = "error: (\(transferResult!.resultCode))\(transferResult!.resultMsg) "
            print("**message : ",errorMessage)
            uikitFuncs.labelSettings(label: transferInfoLabel, title: errorMessage, size: 15, color: .black)
            transferInfoLabel.textColor = .red
            
        }
        uikitFuncs.buttonSettings(button: backToRootButton, title: "확인", fontSize: 17, tintColor: .black)
        
        backToRootButton.backgroundColor = .lightGray
        backToRootButton.layer.cornerRadius = 10
    }

    private func setConstraints(){
        transferSuccessLabel.translatesAutoresizingMaskIntoConstraints = false
        transferInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        backToRootButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            transferSuccessLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            transferSuccessLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            transferInfoLabel.topAnchor.constraint(equalTo: transferSuccessLabel.bottomAnchor, constant: 20),
            transferInfoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            backToRootButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            backToRootButton.heightAnchor.constraint(equalToConstant: 50),
            backToRootButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backToRootButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    @IBAction func pushToRootButton(_ sender: Any) {
        accountListModel.delegate = self
        accountListModel.getAccountList(user: userInfo.userName)
        
        self.navigationController?.popToRootViewController(animated: true)
    }
}

extension TransferSuccessViewController: OTPModelDelegate{
    func OTPRetrieved(otpResult: OTPResult) {
        self.otpResult = otpResult
        
        print("otpREesult ", otpResult)
        
        transferModel.delegate = self
        transferModel.askTransfer(userId: userInfo.userName, sendAccountId: transferInfo[0], recvAccountId: transferInfo[2], amount: Int(transferInfo[3]) ?? 0, transferHistory: transferInfo[4], otp: self.otpResult!.otp, memo: "memomemo")
    }
}

extension TransferSuccessViewController: TransferDelegate{
    func TransferRetrieved(transferResult: TransferResult) {
        self.transferResult = transferResult
        
        settings()
    }
}

extension TransferSuccessViewController: AccountListModelDelegate{
    func AccountListRetrieved(accounts: [AccountList]) {
        self.accountListResult = accounts
        
        UserDefaultFuncs.save(accountListResult)
        self.savedAccountInfo = UserDefaultFuncs.get()
        print("-- ^^ -- ^^ -- ^^ savedAccounInfo", savedAccountInfo)
    }
}
