//
//  TransferHistoryCollectionViewCell.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/02.
//

import UIKit

class TransferHistoryCell: UICollectionViewCell {
    
    @IBOutlet weak var transferDateLabel: UILabel!
    @IBOutlet weak var transferedAccountNameLabel: UILabel!
    @IBOutlet weak var transferedAmountLabel: UILabel!
    @IBOutlet weak var afterTransferAccountBalanceLabel: UILabel!
    
    let cellIdentifier = "transferHistoryCell"
    
    let uikitFuncs = UIKitFuncs()
    let fakeUsedData = AccountModel().usedInformation
    
    func cellSettings(index: Int, accountHistoryList: [AccountHistoryList]) {
        
        self.layer.borderWidth = 0.2
        self.backgroundColor = .white
        
        //날짜 레이블 바꾸기
        let date = accountHistoryList[index].date
        let dateArray = date.map {String($0)}
        
        let dateDisplay = Array(dateArray[5...9])
        
        uikitFuncs.labelSettings(label: transferDateLabel, title: dateDisplay[0], size: 15, color: .black)
        uikitFuncs.labelSettings(label: transferedAccountNameLabel, title: accountHistoryList[index].recvName, size: 15, color: .black)
        uikitFuncs.labelSettings(label: transferedAmountLabel, title: accountHistoryList[index].amount, size: 15, color: .black)
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
