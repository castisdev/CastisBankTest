//
//  EditAccountOrderViewController.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/02.
//

import UIKit

class EditAccountOrderViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let fakeModel = AccountModel().mainCellInformation
    
    let editCell = ChangeAccountOrderTableViewCell()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.frame = view.bounds
        
        tableView.frame = tableView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        tableView.separatorStyle = .singleLine
        
        // Do any additional setup after loading the view.
    }

}

extension EditAccountOrderViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fakeModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: editCell.cellIdentifier) as? ChangeAccountOrderTableViewCell else {
            return UITableViewCell()
        }
        
        cell.cellSettings(index: indexPath.row)
        cell.setConstraints()
        return cell
    }
    
    @IBAction func pushExitBarButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
