//
//  SetInformationViewController.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/02.
//

import UIKit

//for receiving data from setInformationViewController.swift delegate
protocol SendUpDateDelegate: AnyObject {
    func sendUpdate(selectedData: [String])
}

class SetInformationViewController: UIViewController {
    
    //MARK: - declare instances
    @IBOutlet weak var tableView: UITableView!
    
    let fakeModels = AccountModel().searchInfo
    let uikitFuncs = UIKitFuncs()
    
    let setInfoCell = SetFilterCell()
    let confirmCell = ApplyFilterCell()
    
    //default value
    var receivedInfo = ["1개월","전체","최신순"]
    var delegate: SendUpDateDelegate?
    
    //MARK: - VC life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.frame = view.bounds
        tableView.frame = tableView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        tableView.separatorStyle = .none
        
        //view size
//        self.view.clipsToBounds = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("view will disappear")
    }
}

//MARK: - about cell
extension SetInformationViewController: UITableViewDelegate, UITableViewDataSource{
    
    //number of section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    //number of rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return fakeModels.count
        case 1:
            return 1
        default:
            return 0
        }
    }
    
    //height of row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let halfWidth = UIScreen.main.bounds.width
        
        switch indexPath.section {
        case 0:
            return halfWidth / 3
        case 1:
            return halfWidth / 4
        default:
            return 0
        }
    }
    
    // cell setting
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: setInfoCell.cellIdentifier) as? SetFilterCell else {
            return UITableViewCell()
        }
        
        guard let confirmCell = tableView.dequeueReusableCell(withIdentifier: confirmCell.cellIdentifier) as? ApplyFilterCell else {
            return UITableViewCell()
        }
        
//        func segmentValueChanged(_ sender: UISegmentedControl){
//
//        }
        
        switch indexPath.section {
        case 0:
            cell.cellSettings(index: indexPath.row, selected: receivedInfo)
            cell.setConstraints()
            
            //when segment value changed
            cell.choiceSegmentControl.addTarget(self, action: #selector(segmentValueChanged(_:)), for: .valueChanged)
            cell.choiceSegmentControl.tag = indexPath.row
            return cell
        case 1:
            confirmCell.cellSettings()
            confirmCell.setConstraints()
            return confirmCell
        default:
            return cell
        }
    }
  
    //check button action(with segment's changed value
    @IBAction func backToInfo(_ sender: Any) {
        
        delegate?.sendUpdate(selectedData: receivedInfo)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    //act when sement value changed
    @objc func segmentValueChanged(_ sender: UISegmentedControl){
        self.receivedInfo[sender.tag] = fakeModels[sender.tag].standards[sender.selectedSegmentIndex]
    }
    
}

