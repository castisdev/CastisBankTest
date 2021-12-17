//
//  UseDetailViewController.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/02.
//

import UIKit

class UseDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backToHistoryButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    let detailTransferInfoCell = DetailTransferInfoCell()
    
    var selectedInfo = [AccountHistoryList]()
    
    var selectedCellInfo = [String]()
    var selectedAccountDate = ""
    var selectedAccountType = ""
    var selectedAccountAmount = ""
    var selectedAccountBalance = ""
    var selectedAccountName = ""
    
    
    
    let uikitFuncs = UIKitFuncs()
    let colorChip = ColorChip()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        selectedCellInfo = [selectedAccountDate, selectedAccountType, selectedAccountAmount, selectedAccountBalance]
        navigationSettings()
        viewSettings()
    }
    
    func navigationSettings(){
        
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = selectedAccountName
//        self.navigationController?.navigationBar.largeTitleTextAttributes{
//            .font: UIFont(name: , size: 10)
//        }
    }
    
    func viewSettings(){
        uikitFuncs.buttonSettings(button: backToHistoryButton, title: "확인", fontSize: 15, tintColor: .systemBlue)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        backToHistoryButton.translatesAutoresizingMaskIntoConstraints = false
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  10),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            backToHistoryButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20),
            backToHistoryButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            backToHistoryButton.heightAnchor.constraint(equalToConstant: 50),
            backToHistoryButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            shareButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20),
            shareButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            shareButton.trailingAnchor.constraint(equalTo: backToHistoryButton.leadingAnchor, constant: -20),
            shareButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            shareButton.heightAnchor.constraint(equalToConstant: 50),
            shareButton.widthAnchor.constraint(equalToConstant: 50)
        ])
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
        
//        let displayInfo = selectedInfo[selectedInfo.count - (selectedCellInfo + 1)]
        cell.cellSettings(index: indexPath.row, accountInfo: self.selectedCellInfo)
        cell.setContraints()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    @IBAction func returnToDetailView(_ sender: Any){
        self.navigationController?.popViewController(animated: true)
    }
}


