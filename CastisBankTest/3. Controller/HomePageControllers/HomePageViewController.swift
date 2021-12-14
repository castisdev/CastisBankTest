//
//  HomePageViewController.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/02.
//

import UIKit

protocol OTPSendingDelegate{
    func OTPRetrieved(otp: String)
}

class HomePageViewController: UIViewController{
    
    //MARK: declare instances
    @IBOutlet weak var collectionView: UICollectionView!
    
    let accountInfoCell = MainAccountCell()
    let editAccountCell = EditOrderCell()
    
    let uikitFuncs = UIKitFuncs()
    let detailFuncs = DetailFuncs()
    
    //MARK: cell information (from server, from edit order VC)
    let userName = "test1"
    var accountList = [AccountList]()
    var accountModel = AccountListModel()
    
    var otpModel = OTPModel()
    var otpResult: OTPResult?
    var delegate: OTPSendingDelegate?
    
    //MARK: selected cell info (to account history VC)
    var selectedAccountInfo = ["name", "number", "balance"]
    
    //MARK: seperate segue by identifier (connected with storyboard)
    let toHistorySegueIdentifier = "accountUseSegue"
    let toEditOrderSegueIdentifier = "editAccountSegue"
    
    //MARK: - VC life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        //collectionView size 설정
        collectionView.frame = view.bounds

        setFlowLayout(view: collectionView)
        setNavigation()
        
        //MARK: receive cell information data from server(url)
        accountModel.delegate = self
        accountModel.getAccountList(user: userName)
        
        otpModel.delegate = self
        
    }
    
    
    //MARK: prepare devided by segue identifier
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == toEditOrderSegueIdentifier {
            
            guard let editAccountOrderViewController = segue.destination as? EditAccountOrderViewController else {
                return print("segue error from: Home Page => Edit Order Page")
            }
            editAccountOrderViewController.delegate = self
            editAccountOrderViewController.receivedAccountList = accountList
            
        } else if segue.identifier == toHistorySegueIdentifier {
            
            guard let accountUseViewController = segue.destination as? AccountUseViewController else {
                return print("segue error from: Home Page => Account Use")
            }
            
            accountUseViewController.accountInfo = selectedAccountInfo
            accountUseViewController.otpString = otpResult?.otp ?? "otp"
        }
    }
    
    //MARK: custom navigation bar
    func setNavigation(){

        let label = UILabel()
                   
        //for setting label constraints
        label.translatesAutoresizingMaskIntoConstraints = false
        
        //label custom(color: for recognize)
        label.text = userName
//        label.backgroundColor = .green
        label.textAlignment = .left
      
        //insert customed label to navigation title
        navigationItem.titleView = label
     
        //set the contraints of label
        if let navigationBar = navigationController?.navigationBar {
            NSLayoutConstraint.activate([
                label.widthAnchor.constraint(equalTo: navigationBar.widthAnchor, constant: -60)
            ])
        }
    }
}

//MARK: - cell settings
extension HomePageViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch(section){
        case 0:
            return accountList.count
        case 1:
            return 1
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: accountInfoCell.cellIdentifier, for: indexPath) as? MainAccountCell else {
            return UICollectionViewCell()
        }
        
        guard let editCell = collectionView.dequeueReusableCell(withReuseIdentifier: editAccountCell.cellIdentifier, for: indexPath) as? EditOrderCell else {
            return UICollectionViewCell()
        }
        
        //마지막 셀은 edit.. 이거 좀 고쳐야 할듯 ㅠㅠ => section으로 바꿈.
        //배열 순서대로 하니까, 셀이 reusable 이기 때문에 자꾸 바뀌는 듯..! 아니네.
        switch(indexPath.section){
        case 0:
            print("cell made account list : ", accountList)
            cell.cellSettings(index: indexPath.row, accountList: accountList)
            
            //tag for sending information
            cell.useInformationOfAccountButton.tag = indexPath.row
            cell.setConstraints()
            
            return cell
        case 1:
            editCell.cellSettings()
            editCell.setConstraints()
            return editCell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch(indexPath.section){
        case 0:
            return uikitFuncs.cellSizeSetting(widthPadding: 40, heightRatio: 2.3)
        case 1:
            return uikitFuncs.cellSizeSetting(widthPadding: 45, heightRatio: 3)
        default:
            return CGSize(width: 0, height: 0)
        }
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        let interval = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

        return interval
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 20
//    }
    
    //같은 섹션 안의 아이템의 행 간격
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
    
    public func setFlowLayout(view: UICollectionView){

        //flowLayout
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 15
        
        flowLayout.minimumInteritemSpacing = 20

        view.collectionViewLayout = flowLayout
    }
    
    
    //MARK: - segue actions
    @IBAction func buttonPressed(_ sender: UIButton){

        self.selectedAccountInfo[0] = accountList[sender.tag].name
        self.selectedAccountInfo[1] = accountList[sender.tag].id
        self.selectedAccountInfo[2] = detailFuncs.makeMoneyAmountEasy(amount: accountList[sender.tag].balance)
        
        otpModel.getOTP(userId: "test1", companyId: "talkis_app")
//        print(otpResult)
    }
}

//MARK: - delegate methods

//MARK: from data which is from server(url)
extension HomePageViewController: AccountListModelDelegate {
    func AccountListRetrieved(accounts: [AccountList]) {
//        print("accounts retrieved from account list model!")
//        print("retrieved accounts:", accounts)
        self.accountList = accounts
        
        collectionView.reloadData()
    }
}

//MARK: from editing accounts' order VC
extension HomePageViewController: sendUpdateAccountOrderDelegate {
    func sendUpdate(updatedOrderList: [AccountList]) {
        accountList = updatedOrderList
        
        self.collectionView.reloadData()
    }
}

extension HomePageViewController: OTPModelDelegate{
    func OTPRetrieved(otpResult: OTPResult) {
        self.otpResult = otpResult
        print(otpResult)
    }
}
