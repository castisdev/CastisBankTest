//
//  numberCell.swift
//  CastisBankTest
//
//  Created by 탁제원 on 2021/12/21.
//

import UIKit

class NumberCell: UICollectionViewCell {
    
    let cellIdentifier = "numberCell"
    
    let numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", " ", "0", "←"]
    let uikitFuncs = UIKitFuncs()
    
    @IBOutlet weak var numberLabel: UILabel!
    
    
    func cellSettings(index: Int){
        uikitFuncs.labelSettings(label: numberLabel, title: numbers[index], size: 17, color: .black)
        
//        self.layer.borderWidth = 0.3
        self.layer.cornerRadius = 10
    }
    
    func setConstraints(){
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            numberLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            numberLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
}
