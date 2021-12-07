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
    
    func cellSettings(){
        
//        self.layer.borderWidth = 0
        uikitFuncs.buttonSettings(button: confirmButton, title: "확인", fontSize: 15, color: .black)
    }
    
    func setConstraints(){
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            confirmButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            confirmButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }

}
