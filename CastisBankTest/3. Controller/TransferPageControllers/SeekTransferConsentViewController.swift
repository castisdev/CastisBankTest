//
//  SeekTransferConsentViewController.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/02.
//

import UIKit

class SeekTransferConsentViewController: UIViewController {
    
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var accountLabel: UILabel!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var transferButton: UIButton!
    
    var receivingAccountInfo = ["받는 계좌 이름", "받는 계좌 번호"]
    var sendingAccountInfo = ["보내는 계좌 이름", "보내는 계좌 번호"]
    var sendingAmount = ""
    var sendingMemo = ""
    
    let uikitFuns = UIKitFuncs()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settings()
        setConstraints()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setNavigation()
    }
    
    private func setNavigation(){
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func settings(){
        self.navigationController?.isNavigationBarHidden = true
        
        uikitFuns.buttonSettings(button: cancelButton, title: "취소", fontSize: 17, tintColor: .black)
        uikitFuns.buttonSettings(button: transferButton, title: "이체하기", fontSize: 17, tintColor: .black)
        
        let receiveInfo = "\(receivingAccountInfo[1])(\(receivingAccountInfo[0]))"
        let moneyComment = "\(receiveInfo)에게 \(sendingAmount)원 \n 이체하시겠습니까?"
        let accountComment = "받는계좌: \(receivingAccountInfo[1])"
        
        uikitFuns.labelSettings(label: moneyLabel, title: moneyComment, size: 20, color: .black)
        moneyLabel.numberOfLines = 2
        moneyLabel.textAlignment = .center
        uikitFuns.labelSettings(label: accountLabel, title: accountComment, size: 15, color: .darkGray)
        
    }
    
    private func setConstraints(){
        moneyLabel.translatesAutoresizingMaskIntoConstraints = false
        accountLabel.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        transferButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            moneyLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            moneyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            accountLabel.topAnchor.constraint(equalTo: moneyLabel.bottomAnchor, constant: 10),
            accountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cancelButton.topAnchor.constraint(equalTo: accountLabel.bottomAnchor, constant: 50),
            cancelButton.heightAnchor.constraint(equalToConstant: 50),
            cancelButton.widthAnchor.constraint(equalToConstant: 100),
            
            transferButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            transferButton.topAnchor.constraint(equalTo: accountLabel.bottomAnchor, constant: 50),
            transferButton.heightAnchor.constraint(equalToConstant: 50),
            transferButton.leadingAnchor.constraint(equalTo: cancelButton.trailingAnchor, constant: 20)
        ])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let transferSuccessViewController = segue.destination as? TransferSuccessViewController else {
            return print("segue error : seek consent -> transfer success")
        }
        
        transferSuccessViewController.transferInfo = [sendingAccountInfo[1] ,receivingAccountInfo[0], receivingAccountInfo[1], sendingAmount, sendingMemo]

    }

    @IBAction func pushPopButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
//    @IBAction func applyTransferButton(_ sender: Any) {
//
//        let presentVC = self.presentingViewController
//
//        self.dismiss(animated: true, completion: {
//            presentVC?.performSegue(withIdentifier: "toTransferSuccessSegue", sender: nil)
//        })
//    }
}
