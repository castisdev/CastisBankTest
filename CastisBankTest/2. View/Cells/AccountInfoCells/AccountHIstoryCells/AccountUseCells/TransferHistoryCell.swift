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
    @IBOutlet weak var transferTypeLabel: UILabel!
    
    let cellIdentifier = "transferHistoryCell"
    
    let uikitFuncs = UIKitFuncs()
    let detailFuncs = DetailFuncs()
    let colorChip = ColorChip()
    let user = "test1"
    
    let historyModel = AccountHistoryModel()
    
    func cellSettings(index: Int, accountHistoryList: [AccountHistoryList], accountNum : String) {
        
        self.layer.borderWidth = 0.2
        self.backgroundColor = .white
        
        
        let date = String(detailFuncs.makeDate(fullDate: accountHistoryList[index].date))
        let amount = detailFuncs.makeStringDoubleToInt(string: accountHistoryList[index].amount)
        let balance = detailFuncs.makeStringDoubleToInt(string: accountHistoryList[index].balance)
        
        //입금출금 구분
        if accountHistoryList[index].recvAccount == accountNum {
            uikitFuncs.labelSettings(label: transferedAmountLabel, title: "+" + detailFuncs.makeMoneyAmountEasy(amount: amount), size: 15, color: .black)
        } else if accountHistoryList[index].sendAccount == accountNum {
            uikitFuncs.labelSettings(label: transferedAmountLabel, title: "-" + detailFuncs.makeMoneyAmountEasy(amount: amount), size: 15, color: .black)
        }
        
        uikitFuncs.labelSettings(label: transferDateLabel, title: date, size: 15, color: .black)
        uikitFuncs.labelSettings(label: transferedAccountNameLabel, title: accountHistoryList[index].recvName, size: 15, color: .black)
        uikitFuncs.labelSettings(label: afterTransferAccountBalanceLabel, title: detailFuncs.makeMoneyAmountEasy(amount: balance), size: 13, color: .darkGray)

        uikitFuncs.labelSettings(label: transferTypeLabel, title: "#" + detailFuncs.typeInKorean(type: accountHistoryList[index].type), size: 12, color: colorChip.kakaoDarkBlue42)
        
    }
    
    func setConstraints(){
        transferDateLabel.translatesAutoresizingMaskIntoConstraints = false
        transferedAccountNameLabel.translatesAutoresizingMaskIntoConstraints = false
        transferedAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        afterTransferAccountBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        transferTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            transferDateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            transferDateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            
            transferedAccountNameLabel.leadingAnchor.constraint(equalTo: transferDateLabel.trailingAnchor, constant: 20),
            transferedAccountNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            
            
            transferTypeLabel.topAnchor.constraint(equalTo: transferedAccountNameLabel.bottomAnchor, constant: 10),
            transferTypeLabel.leadingAnchor.constraint(equalTo: transferDateLabel.trailingAnchor, constant: 20),
            
            transferedAmountLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            self.trailingAnchor.constraint(equalTo: transferedAmountLabel.trailingAnchor, constant: 20),
            
            afterTransferAccountBalanceLabel.topAnchor.constraint(equalTo: transferedAmountLabel.bottomAnchor, constant: 10),
            self.trailingAnchor.constraint(equalTo: afterTransferAccountBalanceLabel.trailingAnchor, constant: 20)
        ])
    }
}
