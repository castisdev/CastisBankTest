//
//  SetSearchInformationCollectionViewCell.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/02.
//

import UIKit

class SetFilterCell: UITableViewCell {
    
    @IBOutlet weak var searchStandardNameLabel: UILabel!
    @IBOutlet weak var choiceSegmentControl: UISegmentedControl!
    
    let cellIdentifier = "setSearchCell"
    
    let uikitFuncs = UIKitFuncs()
    let filterModel = FilterModel().searchInfo
    
    func cellSettings(index: Int, selected: [String]){
        
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        
        uikitFuncs.labelSettings(label: searchStandardNameLabel, title: filterModel[index].searchStandard, size: 15, color: .black)
        uikitFuncs.segmentSetting(segment: choiceSegmentControl, items: filterModel[index].standards)
        
        let selectedIndex = filterModel[index].standards.firstIndex(of: selected[index])
        choiceSegmentControl.selectedSegmentIndex = selectedIndex ?? 0
        
    }
    
    func setConstraints() {
        searchStandardNameLabel.translatesAutoresizingMaskIntoConstraints = false
        choiceSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchStandardNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            searchStandardNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            
            choiceSegmentControl.topAnchor.constraint(equalTo: searchStandardNameLabel.bottomAnchor, constant: 10),
            choiceSegmentControl.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            choiceSegmentControl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            choiceSegmentControl.heightAnchor.constraint(equalToConstant: 50),
            
            self.trailingAnchor.constraint(equalTo: choiceSegmentControl.trailingAnchor, constant: 10)
        ])
    }
    
    func isSegmentChanged(index: Int) -> [String]{
        
        var sending: [String] = ["", "", ""]
        
        let changedIndex = choiceSegmentControl.selectedSegmentIndex
        sending[index] = filterModel[index].standards[changedIndex]
        
        return sending
        
    }
}
