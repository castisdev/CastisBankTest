//
//  TransferHistoryCollectionViewCell.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/02.
//

import UIKit

class TransferHistoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var transferDateLabel: UILabel!
    @IBOutlet weak var transferedAccountNameLabel: UILabel!
    @IBOutlet weak var transferedAmountLabel: UILabel!
    @IBOutlet weak var afterTransferAccountBalanceLabel: UILabel!
    
    let cellIdentifier = "transferHistoryCell"
    
    let uikitFuncs = UIKitFuncs()
    let fakeUsedData = AccountModel().usedInformation
    
    func cellSettings(index: Int) {
        
        self.layer.borderWidth = 0.2

        
        uikitFuncs.labelSettings(label: transferDateLabel, title: fakeUsedData[index].usedDate, size: 15, color: .black)
        uikitFuncs.labelSettings(label: transferedAccountNameLabel, title: fakeUsedData[index].receivedAccount, size: 15, color: .black)
        uikitFuncs.labelSettings(label: transferedAmountLabel, title: fakeUsedData[index].usedMondy, size: 15, color: .black)
        uikitFuncs.labelSettings(label: afterTransferAccountBalanceLabel, title: fakeUsedData[index].balance, size: 13, color: .darkGray)
    }
    
    func setConstraints(){
        transferDateLabel.translatesAutoresizingMaskIntoConstraints = false
        transferedAccountNameLabel.translatesAutoresizingMaskIntoConstraints = false
        transferedAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        afterTransferAccountBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            transferDateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            transferDateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            
            transferedAccountNameLabel.leadingAnchor.constraint(equalTo: transferDateLabel.trailingAnchor, constant: 20),
            transferedAccountNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            
            transferedAmountLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            self.trailingAnchor.constraint(equalTo: transferedAmountLabel.trailingAnchor, constant: 20),
            
            afterTransferAccountBalanceLabel.topAnchor.constraint(equalTo: transferedAmountLabel.bottomAnchor, constant: 10),
            self.trailingAnchor.constraint(equalTo: afterTransferAccountBalanceLabel.trailingAnchor, constant: 20)
        ])
    }
}
