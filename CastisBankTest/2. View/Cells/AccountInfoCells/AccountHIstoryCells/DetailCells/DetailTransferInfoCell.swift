//
//  DetailTransferInfoTableViewCell.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/02.
//

import UIKit

class DetailTransferInfoCell: UITableViewCell {

    @IBOutlet weak var transactionInfoLabel: UILabel!
    @IBOutlet weak var transactionDetailInfoLabel: UILabel!
    
    let cellIdentifier = "DetailInfoCell"
    
    let info = ["거래시간", "거래구분", "거래 금액", "거래 후 잔액"]
    
    let uikitFuncs = UIKitFuncs()
    let detailFuncs = DetailFuncs()
    let colorChip = ColorChip()
    
    func cellSettings(index: Int, accountInfo: [String]){
        
        uikitFuncs.labelSettings(label: transactionInfoLabel, title: info[index], size: 15, color: .black)
        
        let amount = detailFuncs.makeStringDoubleToInt(string: accountInfo[2])
        let balance = detailFuncs.makeStringDoubleToInt(string: accountInfo[3])
        
        switch index{
        case 0:
            return uikitFuncs.labelSettings(label: transactionDetailInfoLabel, title: accountInfo[0], size: 15, color: .black)
        case 1:
            return uikitFuncs.labelSettings(label: transactionDetailInfoLabel, title: detailFuncs.typeInKorean(type: accountInfo[1]), size: 15, color: .black)
        case 2:
            return uikitFuncs.labelSettings(label: transactionDetailInfoLabel, title: detailFuncs.makeMoneyAmountEasy(amount: amount), size: 15, color: colorChip.kakaoDarkBlue42)
        case 3:
            return uikitFuncs.labelSettings(label: transactionDetailInfoLabel, title: detailFuncs.makeMoneyAmountEasy(amount: balance), size: 15, color: .black)
        default:
            return uikitFuncs.labelSettings(label: transactionDetailInfoLabel, title: " ", size: 15, color: .black)
        }
    }
    
    func setContraints() {
        transactionInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        transactionDetailInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            transactionInfoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            transactionInfoLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            transactionDetailInfoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            transactionDetailInfoLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }

}