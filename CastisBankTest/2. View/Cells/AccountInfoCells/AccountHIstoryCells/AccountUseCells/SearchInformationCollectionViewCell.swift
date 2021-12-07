//
//  SearchInformationCollectionViewCell.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/02.
//

import UIKit

class SearchInformationCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var afterSettingSearchInfoButton: UIButton!
    
    let uikitfuncs = UIKitFuncs()
    
    let cellIdentifier = "searchInfoCell"
    
    func cellSettings(month: String, type: String, order: String){
        
        self.layer.borderWidth = 0.2
        
        let searchInfo = "\(month) / \(type) / \(order)"
        uikitfuncs.buttonSettings(button: afterSettingSearchInfoButton, title: searchInfo, fontSize: 20, tintColor: .black)
        
    }
    
    func setConstraints(){
        afterSettingSearchInfoButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.trailingAnchor.constraint(equalTo: afterSettingSearchInfoButton.trailingAnchor, constant: 10),
            afterSettingSearchInfoButton.centerYAnchor.constraint(equalTo: self.centerYAnchor)
    
        ])
    }
}
