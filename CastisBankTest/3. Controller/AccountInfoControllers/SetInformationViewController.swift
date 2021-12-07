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
        tableView.frame = tableView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        tableView.separatorStyle = .none
        
        //view size
//        self.view.clipsToBounds = true
    }
    
    private func setViewConstraint(){
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 300)
        ])
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
            return halfWidth / 4
        case 1:
            return halfWidth / 4
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

