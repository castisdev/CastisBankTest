//
//  AccountInfoCollectionViewCell.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/02.
//

import UIKit

class AccountInfoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var accountNameLabel: UILabel!
    @IBOutlet weak var accountNumber: UILabel!
    @IBOutlet weak var mainAccountStarImageView: UIImageView!
    @IBOutlet weak var accountBalance: UILabel!
    
    @IBOutlet weak var transferButton: UIButton!
    @IBOutlet weak var useInformationOfAccount: UIButton!
    
    let accountInfoCellIdentifier = "accountInfoCell"
}
