//
//  UseDetailViewController.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/02.
//

import UIKit

class UseDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let detailTransferInfoCell = DetailTransferInfoCell()
    
    var selectedInfo = [AccountHistoryList]()
    var selectedCellInfo = 3

    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        tableView.frame = view.bounds
        print(" view make bounds ")
        
        tableView.delegate = self
        tableView.dataSource = self
    
        print("selected Index : ", selectedCellInfo, " count :", selectedInfo.count, " which : ", selectedInfo.count - (selectedCellInfo + 1))
        
    }
}

extension UseDetailViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailTransferInfoCell.info.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: detailTransferInfoCell.cellIdentifier) as? DetailTransferInfoCell else {
            return UITableViewCell()
        }
        
        let displayInfo = selectedInfo[selectedInfo.count - (selectedCellInfo + 1)]
        cell.cellSettings(index: indexPath.row, accountInfo: displayInfo)
        cell.setContraints()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}


