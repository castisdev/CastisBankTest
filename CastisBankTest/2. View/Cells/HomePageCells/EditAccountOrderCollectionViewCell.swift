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
    
    func cellSettings(){
        
        labelSettings(label: editAccountOrderLabel, text: "화면 편집", color: .darkGray, size: 15)
        
        func labelSettings(label: UILabel, text: String, color: UIColor, size: CGFloat){
            label.text = text
            label.tintColor = color
            label.font = UIFont.systemFont(ofSize: size)
        }
    }
    
    func setConstraints(){
        editAccountOrderLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            editAccountOrderLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            editAccountOrderLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5)
        ])
    }
}
