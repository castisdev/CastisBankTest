//
//  SelectedAccountInfoCollectionViewCell.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/02.
//

import UIKit

class SelectedInfoCell: UICollectionViewCell {
    
    @IBOutlet weak var accountNubmerLabel: UILabel!
    @IBOutlet weak var accountBalanceLabel: UILabel!
    @IBOutlet weak var transferButton: UIButton!
    
    let cellIdentifier = "selectedAccountCell"
    
    let uikitFuncs = UIKitFuncs()
    let colorChip = ColorChip()
    
    func cellSettings(number: String, balance: String) {
        
        self.backgroundColor = colorChip.kakaoYello
        
        uikitFuncs.labelSettings(label: accountNubmerLabel, title: number, size: 15, color: .black)
        uikitFuncs.labelSettings(label: accountBalanceLabel, title: balance, size: 20, color: .black)
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
            accountBalanceLabel.topAnchor.constraint(equalTo: accountNubmerLabel.bottomAnchor, constant: 10),
            
            transferButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            transferButton.topAnchor.constraint(equalTo: accountBalanceLabel.bottomAnchor, constant: 20),
            transferButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            transferButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}
