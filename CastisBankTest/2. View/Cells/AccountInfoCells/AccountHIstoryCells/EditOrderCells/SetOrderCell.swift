//
//  ChangeAccountOrderTableViewCell.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/02.
//

import UIKit

class SetOrderCell: UITableViewCell {

    @IBOutlet weak var mainAccountStarImageView: UIImageView!
    @IBOutlet weak var accountNameLabel: UILabel!
    @IBOutlet weak var accountBalanceLabel: UILabel!
//    @IBOutlet weak var changingOrderButton: UIButton!
    
    @IBOutlet weak var exitButton: UIBarButtonItem!
    
    let cellIdentifier = "changeOrderCell"
    
    let uikitFunc = UIKitFuncs()
    let fakeModel = AccountModel().mainCellInformation
    
    
    func cellSettings(index: Int){
        uikitFunc.labelSettings(label: accountNameLabel, title: fakeModel[index].accountName, size: 15, color: .black)
        uikitFunc.labelSettings(label: accountBalanceLabel, title: fakeModel[index].accountBalance, size: 15, color: .black)
//        uikitFunc.buttonSettings(button: changingOrderButton, title: "", fontSize: 15, tintColor: .systemBlue)

        uikitFunc.starSetting(imageView: mainAccountStarImageView, color: .black, size: 15, index: index)
    }
    
    func setConstraints(){
        mainAccountStarImageView.translatesAutoresizingMaskIntoConstraints = false
        accountNameLabel.translatesAutoresizingMaskIntoConstraints = false
        accountBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
//        changingOrderButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainAccountStarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            mainAccountStarImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            accountNameLabel.leadingAnchor.constraint(equalTo: mainAccountStarImageView.trailingAnchor, constant: 10),
            accountNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            accountBalanceLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
//            changingOrderButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
//            changingOrderButton.leadingAnchor.constraint(equalTo: accountBalanceLabel.trailingAnchor, constant: 10),
            
            self.trailingAnchor.constraint(equalTo:accountBalanceLabel.trailingAnchor, constant: 55)
        ])
    }
    
    func isOrderChanged(list: [AccountModel]){
        
    }
}
