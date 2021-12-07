//
//  SetInformationViewController.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/02.
//

import UIKit

class SetInformationViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let fakeModels = AccountModel().searchInfo
    let uikitFuncs = UIKitFuncs()
    
    let setInfoCell = SetSearchInformationCollectionViewCell()
    let confirmCell = SetSearchCheckTableViewCell()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.frame = view.bounds
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
//            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
//            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])

        // Do any additional setup after loading the view.
    }
    
    
}

extension SetInformationViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let halfWidth = UIScreen.main.bounds.width
        
        switch indexPath.section {
        case 0:
            return halfWidth / 3
        case 1:
            return halfWidth / 5
        default:
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: setInfoCell.cellIdentifier) as? SetSearchInformationCollectionViewCell else {
            return UITableViewCell()
        }
        
        guard let confirmCell = tableView.dequeueReusableCell(withIdentifier: confirmCell.cellIdentifier) as? SetSearchCheckTableViewCell else {
            return UITableViewCell()
        }
        
        switch indexPath.section {
        case 0:
            cell.cellSettings(index: indexPath.row)
            cell.setConstraints()
            return cell
        case 1:
            confirmCell.cellSettings()
            confirmCell.setConstraints()
            return confirmCell
        default:
            return cell
        }
    }
    
    
    
    
}
