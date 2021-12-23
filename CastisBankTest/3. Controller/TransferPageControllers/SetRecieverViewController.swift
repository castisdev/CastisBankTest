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
    let transferedListCell = TransferedHistoryTableViewCell()
    
    let userInfo = UserInformation().user
    var accountInfo = ["name", "number", "balance"]
    
    var otpResult: OTPResult?
    let otpModel = OTPModel()
    
    var accountHistoryList = [AccountHistoryList]()
    var accountHistoryService: AccountHistoryService?
    let accountHistoryModel = AccountHistoryModel()
    
    var accountNameList = [String]()
    var accountNumberList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setconstraints()
        displaySettings()
        navigationSettings()
        
        otpModel.delegate = self
        otpModel.getOTP(userId: userInfo.userName, companyId: userInfo.companyId)
        
        accountHistoryModel.delegate = self
        
        print("otpResult at set receiver controller : ", otpResult)
        
        print("received account info : ", accountInfo)
        
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

extension SetRecieverViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("retrieved otp result : ", otpResult?.otp ?? "otp retrieved fail at number of Rows")
        accountHistoryModel.getAccountHistory(userId: userInfo.userName, accountId: accountInfo[1], duration: "5M", startDate: "", endDate: "", otp: otpResult?.otp ?? "otp retrieved fail")
        transferedListCell.recvedList(list: accountHistoryList)
        print("retrieved account history list for 5M : ", accountHistoryList)
        
        accountNameList = transferedListCell.recvedNames
        accountNumberList = transferedListCell.recvedAccounts
        return accountNameList.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: transferedListCell.cellIdentifier) as? TransferedHistoryTableViewCell else {
            return UITableViewCell()
        }
        
        cell.cellSettings(index: indexPath.row, retrievedNames: accountNameList, retrievedAccounts: accountNumberList)
        cell.setConstraints()
        
        return cell
    }
    
}

extension SetRecieverViewController: OTPModelDelegate{
    func OTPRetrieved(otpResult: OTPResult) {
        self.otpResult = otpResult
        
        self.tableView.reloadData()
    }
}

extension SetRecieverViewController: AccountHistoryDelegate{
    func accountHistoryRetrieved(histories: [AccountHistoryList], service: AccountHistoryService) {
        self.accountHistoryList = histories
        self.accountHistoryService = service
        
        self.tableView.reloadData()
    }
}
