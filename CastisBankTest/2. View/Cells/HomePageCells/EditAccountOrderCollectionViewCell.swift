//
//  EditAccountOrderCollectionViewCell.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/02.
//

import UIKit

class EditAccountOrderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var editAccountOrderLabel: UILabel!
    
    let cellIdentifier = "editCell"
    
    let uikitFuncs = UIKitFuncs()
    
    func cellSettings(){
        
//        self.backgroundColor = .yellow
//
//        uikitFuncs.cellSizeSetting(widthPadding: 40, heightRatio: 3)
        
        uikitFuncs.labelSettings(label: editAccountOrderLabel, title: "화면 편집", size: 15,color: .darkGray)
    }
    
    func setConstraints(){
        editAccountOrderLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            editAccountOrderLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            editAccountOrderLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5)
        ])
    }
}
