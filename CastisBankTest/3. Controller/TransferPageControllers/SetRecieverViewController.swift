//
//  SetRecieverViewController.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/02.
//

import UIKit

class SetRecieverViewController: UIViewController {

    @IBOutlet weak var searchAccountInfoSearchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var accountInsertButton: UIButton!
    
    @IBOutlet weak var closeTransferButton: UIBarButtonItem!
    
    let uikitFuncs = UIKitFuncs()
    let colorChip = ColorChip()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setconstraints()
        displaySettings()
        navigationSettings()
    }
    
    func setconstraints(){
        searchAccountInfoSearchBar.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        accountInsertButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchAccountInfoSearchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            searchAccountInfoSearchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchAccountInfoSearchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            searchAccountInfoSearchBar.heightAnchor.constraint(equalToConstant: 50),
            
            tableView.topAnchor.constraint(equalTo: searchAccountInfoSearchBar.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            accountInsertButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20),
            accountInsertButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            accountInsertButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            accountInsertButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            accountInsertButton.heightAnchor.constraint(equalToConstant: 70)
        ])

    }
    
    func displaySettings(){
        uikitFuncs.buttonSettings(button: accountInsertButton, title: "+ 계좌번호 직접입력", fontSize: 17, tintColor: .black)
        accountInsertButton.layer.borderWidth = 0.5
        accountInsertButton.layer.cornerRadius = 10
        
    }
    
    func navigationSettings(){
        navigationController?.title = "이체"
    }

    @IBAction func popToMainButton(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
}
