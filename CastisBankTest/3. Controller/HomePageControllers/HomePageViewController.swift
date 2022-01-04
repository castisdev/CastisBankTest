//
//  HomePageViewController.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/02.
//

import UIKit
import CoreData

class HomePageViewController: UIViewController{
    
    //MARK: declare instances
    @IBOutlet weak var collectionView: UICollectionView!
    
    let accountInfoCell = MainAccountCell()
    let editAccountCell = EditOrderCell()
    let colorCell = ColorCell()
    
    let uikitFuncs = UIKitFuncs()
    let detailFuncs = DetailFuncs()
    
    //MARK: cell information (from server, from edit order VC)
    let userName = UserInformation().user.userName
    var accountList = [AccountList]()
    var accountModel = AccountListModel()
    
    //MARK: selected cell info (to account history VC)
    var selectedAccountInfo = ["name", "number", "balance"]
//    var container: NSPersistentContainer!
    
    //MARK: seperate segue by identifier (connected with storyboard)
    let toHistorySegueIdentifier = "toAccountUseSegue"
    let toEditOrderSegueIdentifier = "editAccountSegue"
    let toTransferSegueIdentifier = "toTransferSegue"
    let toColorChooseSegueIdentifier = "colorChooseSegue"
    
    var selectedCellColor: UIColor?
    
    var userDefault = UserDefaults.standard
    
    
    //MARK: - VC life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        //collectionView size 설정
        collectionView.frame = view.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("- home page view controller view will appear ! -")
    
        setFlowLayout(view: collectionView)
        setNavigation()
        refresh()
        
        //MARK: receive cell information data from server(url)
        accountModel.delegate = self
        accountModel.getAccountList(user: userName)

        
    }
    
    //MARK: prepare devided by segue identifier
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == self.toEditOrderSegueIdentifier {
            
            guard let editAccountOrderViewController = segue.destination as? EditAccountOrderViewController else {
                return print("segue error from: Home Page => Edit Order Page")
            }
            editAccountOrderViewController.delegate = self
            editAccountOrderViewController.receivedAccountList = self.accountList
            
        } else if segue.identifier == self.toHistorySegueIdentifier {
            print("to history segue entered!")
            
            guard let accountUseViewController = segue.destination as? AccountUseViewController else {
                return print("segue error from: Home Page => Account Use")
            }
            
            accountUseViewController.accountInfo = self.selectedAccountInfo
            
        } else if segue.identifier == self.toTransferSegueIdentifier {
            
            transferButtonPressed(sender as! UIButton)
            print("to transfer segue entered! ")
            
            guard let setReceiverViewController = segue.destination as? SetRecieverViewController else {
                return print("segue error from: Home Page => transfer Receiver setting")
            }
            
            print(setReceiverViewController.accountInfo)
            setReceiverViewController.accountInfo = self.selectedAccountInfo
            print("---", setReceiverViewController.accountInfo)
            
        } else if segue.identifier == self.toColorChooseSegueIdentifier{
            
            colorButtonPressed(sender as! UIButton)
            
            guard let colorChooseViewController = segue.destination as? ColorChooseViewController else {
                return print("segue error from: Home Page => color change setting")
            }
            
            colorChooseViewController.cellColor = selectedCellColor
            colorChooseViewController.selectedAccountInfo = [selectedAccountInfo[0], selectedAccountInfo[1]]
        }
    }
    
    //MARK: custom navigation bar
    func setNavigation(){
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.title = userName
//
//        let label = UILabel()
//
//        //for setting label constraints
//        label.translatesAutoresizingMaskIntoConstraints = false
//
//        //label custom(color: for recognize)
//        label.text = userName
////        label.backgroundColor = .green
//        label.textAlignment = .left
//
//        //insert customed label to navigation title
//        navigationItem.titleView = label
//
//        //set the contraints of label
//        if let navigationBar = navigationController?.navigationBar {
//            NSLayoutConstraint.activate([
//                label.widthAnchor.constraint(equalTo: navigationBar.widthAnchor, constant: -60)
//            ])
//        }
    }
    
    func refresh(){
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(updateUI(refresh:)), for: .valueChanged)
        refresh.attributedTitle = NSAttributedString(string: "새로고침")
        
        self.collectionView.refreshControl = refresh
    }
    
    @objc func updateUI(refresh: UIRefreshControl){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
            self.collectionView.reloadData()
            refresh.endRefreshing()
        }
    }
    
    //MARK: - segue actions
    @IBAction func buttonPressed(_ sender: UIButton){

        self.selectedAccountInfo[0] = self.accountList[sender.tag].name
        self.selectedAccountInfo[1] = self.accountList[sender.tag].id
        self.selectedAccountInfo[2] = self.detailFuncs.makeMoneyAmountEasy(amount: accountList[sender.tag].balance)
        
        print("--------------------history-------------------------")
    }
    
    @IBAction func transferButtonPressed(_ sender: UIButton){
        
        self.selectedAccountInfo[0] = self.accountList[sender.tag].name
        self.selectedAccountInfo[1] = self.accountList[sender.tag].id
        self.selectedAccountInfo[2] = self.detailFuncs.makeMoneyAmountEasy(amount: accountList[sender.tag].balance)
        
        print("--------------------transfer-------------------------")
    }
    
    @IBAction func colorButtonPressed(_ sender: UIButton){
        
        self.selectedAccountInfo[0] = self.accountList[sender.tag].name
        self.selectedAccountInfo[1] = self.accountList[sender.tag].id
        self.selectedAccountInfo[2] = self.detailFuncs.makeMoneyAmountEasy(amount: accountList[sender.tag].balance)
        self.selectedCellColor = self.colorCell.colorChipArray[sender.tag]
    }
}

//MARK: - cell settings
extension HomePageViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
//        userDefault.set(try? PropertyListEncoder().encode(accountList), forKey: "accountList")
//        userDefault.set(try? PropertyListEncoder().encode(accountList), forKey: "accountLists")
//
//        if let data = userDefault.value(forKey: "accountList") as? Data {
//            let accountList = try? PropertyListDecoder().decode(AccountList.self, from: data)
//        }
//
//        if let data = userDefault.value(forKey: "accountLists") as? Data {
//            let accountLists = try? PropertyListDecoder().decode([AccountList].self, from: data)
//        }
//
//        var accounts: [AccountList]{
//            get {
//                var lists: [AccountList]?
//                if let data = userDefault.value(forKey: "accoutnLists") as? Data{
//                    lists = try? PropertyListDecoder().decode([AccountList].self, from: data)
//                }
//                return lists ?? []
//            }
//            set {
//                userDefault.set(try? PropertyListEncoder().encode(newValue), forKey: "accountLists")
//            }
//        }
        
//        print("what i got : ", accounts)
        
        switch(section){
        case 0:
            return self.accountList.count
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
        
    
        switch(indexPath.section){
        case 0:
            cell.cellSettings(index: indexPath.row, accountList: accountList)
            
            //tag for sending information
            cell.transferButton.tag = indexPath.item
            cell.useInformationOfAccountButton.tag = indexPath.item
            cell.colorChangeButton.tag = indexPath.item
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
    
}

//MARK: - delegate methods
//MARK: from data which is from server(url)
extension HomePageViewController: AccountListModelDelegate {
    func AccountListRetrieved(accounts: [AccountList]) {
        print("accounts retrieved from account list model!")
//        print("retrieved accounts:", accounts)
        self.accountList = accounts
//        print("after set account list at delegate function :", accountList)
        
        collectionView.reloadData()
        
//        print("after reload data at delegate function :", accountList)
        
    }
}

//MARK: from editing accounts' order VC
extension HomePageViewController: sendUpdateAccountOrderDelegate {
    func sendUpdate(updatedOrderList: [AccountList]) {
        accountList = updatedOrderList
        
        self.collectionView.reloadData()
    }
}

