//
//  AccountInfoCollectionViewCell.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/02.
//

import UIKit

class MainAccountCell: UICollectionViewCell {
    
    @IBOutlet weak var accountNameLabel: UILabel!
    @IBOutlet weak var accountNumberLabel: UILabel!
    @IBOutlet weak var mainAccountStarImageView: UIImageView!
    @IBOutlet weak var accountBalanceLabel: UILabel!
    
    @IBOutlet weak var transferButton: UIButton!
    @IBOutlet weak var useInformationOfAccountButton: UIButton!
    
    let cellIdentifier = "accountInfoCell"
    
    let uikitFuncs = UIKitFuncs()
    let detailFuncs = DetailFuncs()
    
    let cellSize = [
        "widthPadding": 40.0,
        "heightRatio": 2.0
    ]
    
    //set cell settings func
    public func cellSettings(index: Int, accountList: [AccountList]) {
        
        self.layer.cornerRadius = 10
        self.isSelected = false
        
        //set label text
        uikitFuncs.labelSettings(label: accountNameLabel, title: accountList[index].name, size: 15, color: .black)
        uikitFuncs.labelSettings(label: accountNumberLabel, title: accountList[index].id, size: 10, color: .darkGray)
        uikitFuncs.labelSettings(label: accountBalanceLabel, title: detailFuncs.makeMoneyAmountEasy(amount: accountList[index].balance), size: 22, color: .black)
        
        //set button title
        uikitFuncs.buttonSettings(button: transferButton, title: "이체", fontSize: 17, tintColor: .black)
        uikitFuncs.buttonSettings(button: useInformationOfAccountButton, title: "거래내역", fontSize: 5, tintColor: .black)
        
        //set cell color from colorchip
        self.backgroundColor = colorchip.kakaoYello11
        
        //set star image status(Fill or not) => maybe by order...?
        uikitFuncs.starSetting(imageView: mainAccountStarImageView, color: .black, size: 100, index: index)
    }

    
    public func setConstraints() {
        
        accountNameLabel.translatesAutoresizingMaskIntoConstraints = false
        accountNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        mainAccountStarImageView.translatesAutoresizingMaskIntoConstraints = false
        accountBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        transferButton.translatesAutoresizingMaskIntoConstraints = false
        useInformationOfAccountButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            accountNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            accountNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),

            accountNumberLabel.topAnchor.constraint(equalTo: accountNameLabel.bottomAnchor, constant: 5),
            accountNumberLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),

            mainAccountStarImageView.leadingAnchor.constraint(equalTo: accountNameLabel.trailingAnchor, constant: 3),
            mainAccountStarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 22),
            mainAccountStarImageView.heightAnchor.constraint(equalToConstant: 15),
            mainAccountStarImageView.widthAnchor.constraint(equalToConstant: 15),

            accountBalanceLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            accountBalanceLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),

            transferButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            transferButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            transferButton.topAnchor.constraint(equalTo: accountBalanceLabel.bottomAnchor, constant: 10),

            useInformationOfAccountButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            useInformationOfAccountButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),

            //이체 버튼과 거래내역 버튼 크기 동일
            transferButton.trailingAnchor.constraint(equalTo: useInformationOfAccountButton.leadingAnchor, constant: 0),
            transferButton.widthAnchor.constraint(equalTo: useInformationOfAccountButton.widthAnchor),
            transferButton.heightAnchor.constraint(equalTo: useInformationOfAccountButton.heightAnchor)

        ])
    }
}

