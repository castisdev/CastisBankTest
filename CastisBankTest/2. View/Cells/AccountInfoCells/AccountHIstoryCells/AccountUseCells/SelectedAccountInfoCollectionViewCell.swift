//
//  SelectedAccountInfoCollectionViewCell.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/02.
//

import UIKit

class SelectedAccountInfoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var accountNubmerLabel: UILabel!
    @IBOutlet weak var accountBalanceLabel: UILabel!
    @IBOutlet weak var transferButton: UIButton!
    
    let cellIdentifier = "selectedAccountCell"
    
    let uikitFuncs = UIKitFuncs()
    let colorChip = ColorChip()
    
    func cellSettings() {
        
        self.backgroundColor = colorChip.kakaoYello
        
        uikitFuncs.labelSettings(label: accountNubmerLabel, title: "앞에서 받아온 계좌번호", size: 15, color: .black)
        uikitFuncs.labelSettings(label: accountBalanceLabel, title: "앞에서 받아온 계좌 잔액", size: 20, color: .black)
        uikitFuncs.buttonSettings(button: transferButton, title: "이체", fontSize: 15, tintColor: .black)
    }
    
    func setConstraints(){
        accountNubmerLabel.translatesAutoresizingMaskIntoConstraints = false
        accountBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        transferButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            accountNubmerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            accountNubmerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            
            accountBalanceLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            accountBalanceLabel.topAnchor.constraint(equalTo: accountNubmerLabel.bottomAnchor, constant: 20),
            
            transferButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            transferButton.topAnchor.constraint(equalTo: accountBalanceLabel.bottomAnchor, constant: 30),
            transferButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            transferButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}
