//
//  TransferHistoryTableViewCell.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/02.
//

import UIKit

class TransferedHistoryTableViewCell: UITableViewCell {
    
    let uikitFuncs = UIKitFuncs()
        
    var recvedNames: [String] = []
    var recvedAccounts: [String] = []
    
    @IBOutlet weak var receiveredAccountNameLabel: UILabel!
    @IBOutlet weak var receiveredAccountNumberLabel: UILabel!
    let cellIdentifier = "transferedHistoryCell"
    
    func recvedList(list: [AccountHistoryList]){
            
        recvedNames = []
        recvedAccounts = []
            
        //내역이 있으면 recvName과 recvAccount를 append 한다.
        if list.count != 0 {
            for a in 0...list.count - 1{
                recvedNames.append(list[a].recvName)
                recvedAccounts.append(list[a].recvAccount)
            }
        }
            
        //중복 내역 삭제하고 reversed()
        recvedNames = recvedNames.sorted().reversed()
        recvedAccounts = recvedAccounts.sorted().reversed()
    }
        
    func cellSettings(index: Int, retrievedNames: [String], retrievedAccounts: [String]){
        
        uikitFuncs.labelSettings(label: receiveredAccountNameLabel, title: recvedNames[index], size: 10, color: .black)
        uikitFuncs.labelSettings(label: receiveredAccountNumberLabel, title: recvedAccounts[index], size: 10, color: .black)
    }
        
    func setConstraints(){
        receiveredAccountNameLabel.translatesAutoresizingMaskIntoConstraints = false
        receiveredAccountNumberLabel.translatesAutoresizingMaskIntoConstraints = false
            
        NSLayoutConstraint.activate([
            receiveredAccountNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            receiveredAccountNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
                
            receiveredAccountNumberLabel.topAnchor.constraint(equalTo: receiveredAccountNameLabel.bottomAnchor, constant: 10),
            receiveredAccountNumberLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            receiveredAccountNumberLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 10)
        ])
    }

}
