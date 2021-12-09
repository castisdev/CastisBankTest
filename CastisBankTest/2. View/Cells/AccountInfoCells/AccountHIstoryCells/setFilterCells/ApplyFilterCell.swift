//
//  SetSearchCheckTableViewCell.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/06.
//

import UIKit

class ApplyFilterCell: UITableViewCell {

    @IBOutlet weak var applyFilterButton: UIButton!
    
    let cellIdentifier = "confirmCell"
    let uikitFuncs = UIKitFuncs()
    let colorChip = ColorChip()
    
    func cellSettings(){
        
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        
//        self.layer.borderWidth =
        uikitFuncs.buttonSettings(button: applyFilterButton, title: "확인", fontSize: 15, tintColor: .black)
        applyFilterButton.backgroundColor = colorChip.kakaoYello
        applyFilterButton.layer.cornerRadius = 10
    }
    
    func setConstraints(){
        applyFilterButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            applyFilterButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            applyFilterButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            applyFilterButton.heightAnchor.constraint(equalToConstant: 50),
            
            applyFilterButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.trailingAnchor.constraint(equalTo: applyFilterButton.trailingAnchor, constant: 10)
        ])
    }
}
