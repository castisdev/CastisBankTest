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
    @IBOutlet weak var applyOrderButton: UIButton!
    
    let editCell = SetOrderCell()
    let accountListModel = AccountListModel()
    var receivedAccountList = [AccountList]()
    
    let uikitFuncs = UIKitFuncs()
    let colorChip = ColorChip()
    
    //MARK: - VC life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableViewSettings()
        buttonSettings()
        
        setConstraints()
//
//        accountListModel.delegate = self
//        accountListModel.getAccountList(user: "test1")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let homePageViewController = segue.destination as? HomePageViewController else {
            return print("segue error: edit order -> home page")
        }
        homePageViewController.accountList = receivedAccountList
    }
    
    private func tableViewSettings(){
        //seperate line
        tableView.separatorStyle = .singleLine
        
        //enable scroll
        tableView.isScrollEnabled = false
        
        //for editing cell order
        tableView.setEditing(true, animated:false)
    }
    
    private func buttonSettings(){
        uikitFuncs.buttonSettings(button: applyOrderButton, title: "확인", fontSize: 10, tintColor: .black)
        applyOrderButton.backgroundColor = colorChip.kakaoYello
        applyOrderButton.layer.cornerRadius = 10
    }
    
    private func setConstraints(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        applyOrderButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: applyOrderButton.topAnchor, constant: 20),

            applyOrderButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            applyOrderButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            applyOrderButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            applyOrderButton.heightAnchor.constraint(equalToConstant: 50)
        ])
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
        return receivedAccountList.count
    }
    
    //cell setting
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: editCell.cellIdentifier) as? SetOrderCell else {
            return UITableViewCell()
        }
        
        cell.cellSettings(index: indexPath.row, accountList: receivedAccountList)
        cell.setConstraints()
        return cell
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // MARK: - editing the order of cells (by touch and drop)
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        var target: AccountList? = nil
        
        //선택한 인덱스의 모델 삭제해주고
        target = receivedAccountList.remove(at: sourceIndexPath.row)
        
        //item에 담아서
        guard let item = target else { return }
        
        //가져다놓은 index의 위치에 넣는다.
        receivedAccountList.insert(item, at: destinationIndexPath.row)
        
        print(receivedAccountList)
        
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
    
    @IBAction func pushApplyButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

