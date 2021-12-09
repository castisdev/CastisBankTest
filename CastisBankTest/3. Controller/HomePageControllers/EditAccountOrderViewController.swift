//
//  EditAccountOrderViewController.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/02.
//

import UIKit

class EditAccountOrderViewController: UIViewController {
    
    //MARK: - declare instances
    @IBOutlet weak var tableView: UITableView!
    
    var fakeModel = AccountModel().mainCellInformation
    
    let editCell = SetOrderCell()
    
    
    //MARK: - VC life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableViewSettings()
    }
    
    private func tableViewSettings(){
        //inset
        tableView.frame = view.bounds
        tableView.frame = tableView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        tableView.separatorStyle = .singleLine
        
        //enable scroll
        tableView.isScrollEnabled = false
        
        //for editing cell order
        tableView.setEditing(true, animated:false)
        
        
    }

}

extension EditAccountOrderViewController: UITableViewDelegate, UITableViewDataSource{
    
    //MARK: - cell settings
    
    //number of section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //number of rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fakeModel.count
    }
    
    //cell setting
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: editCell.cellIdentifier) as? SetOrderCell else {
            return UITableViewCell()
        }
        
        cell.cellSettings(index: indexPath.row)
        cell.setConstraints()
        return cell
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // MARK: - editing the order of cells (by touch and drop)
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        var target: AccountSpecs? = nil
        
        //선택한 인덱스의 모델 삭제해주고
        target = fakeModel.remove(at: sourceIndexPath.row)
        
        //item에 담아서
        guard let item = target else { return }
        
        //가져다놓은 index의 위치에 넣는다.
        fakeModel.insert(item, at: destinationIndexPath.row)
        
        print(fakeModel)
        
    }
    
    //editing 막음
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    //pop this view
    @IBAction func pushExitBarButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
