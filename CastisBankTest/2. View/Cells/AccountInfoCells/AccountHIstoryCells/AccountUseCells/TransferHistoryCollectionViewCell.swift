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
}
