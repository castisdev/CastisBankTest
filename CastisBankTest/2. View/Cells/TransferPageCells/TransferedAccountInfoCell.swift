//
//  TransferHistoryTableViewCell.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/02.
//

import UIKit

class TransferedAccountInfoCell: UITableViewCell {
    
    let uikitFuncs = UIKitFuncs()
        
    var recievedAccounts = [String:String]()
    
    @IBOutlet weak var receiveredAccountNameLabel: UILabel!
    @IBOutlet weak var receiveredAccountNumberLabel: UILabel!
    let cellIdentifier = "transferedHistoryCell"
    
    func recvedList(list: [AccountHistoryList]){
            
        recievedAccounts = [:]
            
        //내역이 있으면 recvName과 recvAccount를 append 한다.
        if list.count != 0 {
            for a in 0...list.count - 1{
                recievedAccounts.updateValue(list[a].recvAccount, forKey: list[a].recvName)
            }
        }
        
    }
        
    func cellSettings(index: Int, retrievedAccounts: [String: String]){
        
        let retrievedAccountsKey = Array(retrievedAccounts.keys)
        
        uikitFuncs.labelSettings(label: receiveredAccountNameLabel, title: retrievedAccountsKey[index], size: 15, color: .black)
        uikitFuncs.labelSettings(label: receiveredAccountNumberLabel, title: retrievedAccounts[retrievedAccountsKey[index]]!, size: 15, color: .black)
    }
        
    func setConstraints(){
        receiveredAccountNameLabel.translatesAutoresizingMaskIntoConstraints = false
        receiveredAccountNumberLabel.translatesAutoresizingMaskIntoConstraints = false
            
        NSLayoutConstraint.activate([
            receiveredAccountNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            receiveredAccountNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
                
            receiveredAccountNumberLabel.topAnchor.constraint(equalTo: receiveredAccountNameLabel.bottomAnchor, constant: 10),
            receiveredAccountNumberLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            receiveredAccountNumberLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }

}
