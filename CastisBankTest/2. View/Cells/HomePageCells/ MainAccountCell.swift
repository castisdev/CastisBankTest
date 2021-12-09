//
//  AccountInfoCollectionViewCell.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/02.
//

import UIKit

class MainAccountCell: UICollectionViewCell {
    
    @IBOutlet weak var accountNameLabel: UILabel!
    @IBOutlet weak var accountNumber: UILabel!
    @IBOutlet weak var mainAccountStarImageView: UIImageView!
    @IBOutlet weak var accountBalance: UILabel!
    
    @IBOutlet weak var transferButton: UIButton!
    @IBOutlet weak var useInformationOfAccountButton: UIButton!
    
    let cellIdentifier = "accountInfoCell"
    
    let accountModel = AccountModel()
    let uikitFuncs = UIKitFuncs()
    
    let cellSize = [
        "widthPadding": 40.0,
        "heightRatio": 2.0
    ]
    
    //set cell settings func
    public func cellSettings(index: Int) {
        
        self.layer.cornerRadius = 10
        self.isSelected = false
        
        //set label text
        uikitFuncs.labelSettings(label: accountNameLabel, title: accountModel.mainCellInformation[index].accountName, size: 15, color: .black)
        uikitFuncs.labelSettings(label: accountNumber, title: accountModel.mainCellInformation[index].accountNum, size: 10, color: .darkGray)
        uikitFuncs.labelSettings(label: accountBalance, title: accountModel.mainCellInformation[index].accountBalance, size: 22, color: .black)
        
        //set button title
        uikitFuncs.buttonSettings(button: transferButton, title: "이체", fontSize: 10, tintColor: .black)
        uikitFuncs.buttonSettings(button: useInformationOfAccountButton, title: "거래내역", fontSize: 10, tintColor: .black)
        
        //set cell color from colorchip
        self.backgroundColor = accountModel.mainCellInformation[index].cellBackgroundColor
        
        //set star image status(Fill or not) => maybe by order...?
        uikitFuncs.starSetting(imageView: mainAccountStarImageView, color: .black, size: 100, index: index)
    }

    
    public func setConstraints() {
        
        accountNameLabel.translatesAutoresizingMaskIntoConstraints = false
        accountNumber.translatesAutoresizingMaskIntoConstraints = false
        mainAccountStarImageView.translatesAutoresizingMaskIntoConstraints = false
        accountBalance.translatesAutoresizingMaskIntoConstraints = false
        
        transferButton.translatesAutoresizingMaskIntoConstraints = false
        useInformationOfAccountButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            accountNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            accountNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),

            accountNumber.topAnchor.constraint(equalTo: accountNameLabel.bottomAnchor, constant: 5),
            accountNumber.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),

            mainAccountStarImageView.leadingAnchor.constraint(equalTo: accountNameLabel.trailingAnchor, constant: 3),
            mainAccountStarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 22),
            mainAccountStarImageView.heightAnchor.constraint(equalToConstant: 15),
            mainAccountStarImageView.widthAnchor.constraint(equalToConstant: 15),

            accountBalance.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            accountBalance.centerYAnchor.constraint(equalTo: self.centerYAnchor),

            transferButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            transferButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            transferButton.topAnchor.constraint(equalTo: accountBalance.bottomAnchor, constant: 10),

            useInformationOfAccountButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            useInformationOfAccountButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),

            //이체 버튼과 거래내역 버튼 크기 동일
            transferButton.trailingAnchor.constraint(equalTo: useInformationOfAccountButton.leadingAnchor, constant: 0),
            transferButton.widthAnchor.constraint(equalTo: useInformationOfAccountButton.widthAnchor),
            transferButton.heightAnchor.constraint(equalTo: useInformationOfAccountButton.heightAnchor)

        ])
    }
}