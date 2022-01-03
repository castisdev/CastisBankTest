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
    
    @IBOutlet weak var startDateTextField: UITextField!
    @IBOutlet weak var endDateTextField: UITextField!
    @IBOutlet weak var barLabel: UILabel!
    
    let cellIdentifier = "setSearchCell"
    
    let uikitFuncs = UIKitFuncs()
    let filterModel = FilterModel().searchInfo
    
    func cellSettings(index: Int, selected: [String], _ sender: UISegmentedControl){
        
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        
        uikitFuncs.labelSettings(label: searchStandardNameLabel, title: filterModel[index].searchStandard, size: 15, color: .black)
        uikitFuncs.segmentSetting(segment: choiceSegmentControl, items: filterModel[index].standards)
        
        let selectedIndex = filterModel[index].standards.firstIndex(of: selected[index])
        choiceSegmentControl.selectedSegmentIndex = selectedIndex ?? 0
        
        if sender.selectedSegmentIndex == 3{
            self.startDateTextField.alpha = 1
            self.endDateTextField.alpha = 1
            self.barLabel.alpha = 1
        }else {
            self.startDateTextField.alpha = 0
            self.endDateTextField.alpha = 0
            self.barLabel.alpha = 0
        }
        
        uikitFuncs.labelSettings(label: barLabel, title: "-", size: 15, color: .black)
        
        self.startDateTextField.setDatePicker(target: self, selector: #selector(buttonDoneTappedForStartDate))
        self.endDateTextField.setDatePicker(target: self, selector: #selector(buttonDoneTappedForEndDate))
    }
    
    func setConstraints() {
        searchStandardNameLabel.translatesAutoresizingMaskIntoConstraints = false
        choiceSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        startDateTextField.translatesAutoresizingMaskIntoConstraints = false
        barLabel.translatesAutoresizingMaskIntoConstraints = false
        endDateTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchStandardNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            searchStandardNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            
            choiceSegmentControl.topAnchor.constraint(equalTo: searchStandardNameLabel.bottomAnchor, constant: 10),
            choiceSegmentControl.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            choiceSegmentControl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            choiceSegmentControl.heightAnchor.constraint(equalToConstant: 50),
            
            self.trailingAnchor.constraint(equalTo: choiceSegmentControl.trailingAnchor, constant: 10),
            
            startDateTextField.heightAnchor.constraint(equalToConstant: 30),
            startDateTextField.widthAnchor.constraint(equalToConstant: 100),
            startDateTextField.topAnchor.constraint(equalTo: choiceSegmentControl.bottomAnchor, constant: 10),
            startDateTextField.trailingAnchor.constraint(equalTo: barLabel.leadingAnchor, constant: -20),
            
            barLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            barLabel.centerYAnchor.constraint(equalTo: startDateTextField.centerYAnchor),
            
            endDateTextField.heightAnchor.constraint(equalToConstant: 30),
            endDateTextField.widthAnchor.constraint(equalToConstant: 100),
            endDateTextField.topAnchor.constraint(equalTo: choiceSegmentControl.bottomAnchor, constant: 10),
            endDateTextField.leadingAnchor.constraint(equalTo: barLabel.trailingAnchor, constant: 20),
            
        ])
    }
    
    func isSegmentChanged(index: Int) -> [String]{
        
        var sending: [String] = ["", "", ""]
        
        let changedIndex = choiceSegmentControl.selectedSegmentIndex
        sending[index] = filterModel[index].standards[changedIndex]
        
        return sending
        
    }
    
    func setDate(index: Int){
        if index == 3{
                
            NSLayoutConstraint.activate([
                startDateTextField.topAnchor.constraint(equalTo: choiceSegmentControl.bottomAnchor, constant: 20),
                endDateTextField.topAnchor.constraint(equalTo: choiceSegmentControl.bottomAnchor, constant: 20)
            ])
        }
    }
    
    @IBAction func setDate(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 3 {
            self.startDateTextField.alpha = 1
            self.endDateTextField.alpha = 1
            self.barLabel.alpha = 1
        } else {
            self.startDateTextField.alpha = 0
            self.endDateTextField.alpha = 0
            self.barLabel.alpha = 0
        }
    }
    
    @objc func buttonDoneTappedForStartDate(){
        if let datePicker = self.startDateTextField.inputView as? UIDatePicker {
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "yyyymmdd"
            self.startDateTextField.text = dateformatter.string(from: datePicker.date)
        }
        
        self.startDateTextField.resignFirstResponder()
    }
    
    @objc func buttonDoneTappedForEndDate(){
        if let datePicker = self.endDateTextField.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyymmdd"
            self.endDateTextField.text = dateFormatter.string(from: datePicker.date)
        }
        
        self.endDateTextField.resignFirstResponder()
    }
}


extension UITextField {
    
    func setDatePicker(target: Any, selector: Selector){
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline
        datePicker.sizeToFit()
        
        self.inputView = datePicker
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancel = UIBarButtonItem(title: "cancel", style: .plain, target: nil, action: #selector(tapCacel))
        let done = UIBarButtonItem(title: "done", style: .plain, target: nil, action: selector)
        
        toolBar.setItems([cancel, flexible, done], animated: true)
        self.inputAccessoryView = toolBar
    }
    
    @objc func tapCacel() {
        self.resignFirstResponder()
    }
    
    
}
