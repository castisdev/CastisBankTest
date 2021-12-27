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
    
    let uikitFuns = UIKitFuncs()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settings()
        setConstraints()
        // Do any additional setup after loading the view.
    }
    
    private func settings(){
        navigationItem.backBarButtonItem = .none
        uikitFuns.buttonSettings(button: cancelButton, title: "취소", fontSize: 17, tintColor: .black)
        uikitFuns.buttonSettings(button: transferButton, title: "이체하기", fontSize: 17, tintColor: .black)
        
    }
    
    private func setConstraints(){
        moneyLabel.translatesAutoresizingMaskIntoConstraints = false
        accountLabel.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        transferButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            moneyLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            moneyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            accountLabel.topAnchor.constraint(equalTo: moneyLabel.bottomAnchor, constant: 30),
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

    @IBAction func pushPopButton(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
}
