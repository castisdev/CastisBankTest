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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settings()
        setConstraints()
        // Do any additional setup after loading the view.
    }
    
    private func settings(){
        uikitFuncs.labelSettings(label: transferSuccessLabel, title: "이체 완료!", size: 20, color: .black)
        uikitFuncs.buttonSettings(button: backToRootButton, title: "확인", fontSize: 17, tintColor: .black)
        uikitFuncs.labelSettings(label: transferInfoLabel, title: "이체 관련 정보", size: 15, color: .black)
        
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
        self.navigationController?.popToRootViewController(animated: true)
    }
}
