//
//  SetSearchCheckTableViewCell.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/06.
//

import UIKit

class SetSearchCheckTableViewCell: UITableViewCell {

    @IBOutlet weak var confirmButton: UIButton!
    
    let cellIdentifier = "confirmCell"
    let uikitFuncs = UIKitFuncs()
    let colorChip = ColorChip()
    
    func cellSettings(){
        
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        
//        self.layer.borderWidth =
        uikitFuncs.buttonSettings(button: confirmButton, title: "확인", fontSize: 15, tintColor: .black)
        confirmButton.backgroundColor = colorChip.kakaoYello
        confirmButton.layer.cornerRadius = 10
    }
    
    func setConstraints(){
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            confirmButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            confirmButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            confirmButton.heightAnchor.constraint(equalToConstant: 50),
            
            confirmButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.trailingAnchor.constraint(equalTo: confirmButton.trailingAnchor, constant: 10)
        ])
    }
}
