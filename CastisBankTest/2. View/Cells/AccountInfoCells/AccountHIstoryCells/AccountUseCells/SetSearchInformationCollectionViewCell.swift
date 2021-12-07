//
//  SetSearchInformationCollectionViewCell.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/02.
//

import UIKit

class SetSearchInformationCollectionViewCell: UITableViewCell {
    
    @IBOutlet weak var searchStandardNameLabel: UILabel!
    @IBOutlet weak var choiceSegmentControl: UISegmentedControl!
    
    let cellIdentifier = "setSearchCell"
    
    let uikitFuncs = UIKitFuncs()
    let fakeModel = AccountModel().searchInfo
    
    func cellSettings(index: Int){
        
        uikitFuncs.labelSettings(label: searchStandardNameLabel, title: fakeModel[index].searchStandard, size: 15, color: .black)
        
        uikitFuncs.segmentSetting(segment: choiceSegmentControl, items: fakeModel[index].standards)
        
    }
    
    func setConstraints() {
        searchStandardNameLabel.translatesAutoresizingMaskIntoConstraints = false
        choiceSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchStandardNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            searchStandardNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            
            choiceSegmentControl.topAnchor.constraint(equalTo: searchStandardNameLabel.bottomAnchor, constant: 10),
            choiceSegmentControl.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            choiceSegmentControl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            choiceSegmentControl.heightAnchor.constraint(equalToConstant: 50),
            
            self.trailingAnchor.constraint(equalTo: choiceSegmentControl.trailingAnchor, constant: 10)
        ])
    }
}
