//
//  HomePageViewController.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/02.
//

import UIKit

class HomePageViewController: UIViewController, AccountListModelProtocol {
    func AccountListRetrieved(accounts: [AccountList]) {
        print("retrieved")
        print(accounts[0].id)
    }
    
    
    //connect collection view with storyboard
    @IBOutlet weak var collectionView: UICollectionView!
    
    let accountInfoCell = MainAccountCell()
    let editAccountCell = EditOrderCell()
    
    var fakeModel = AccountModel().mainCellInformation
    let fakeUser = AccountModel().userInformation
    
    let uikitFuncs = UIKitFuncs()
    let accountToDisplay = AccountListModel()
    
    var selectedAccountInfo = ["name", "number", "balance"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDIdLoad")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        //collectionView size 설정
        collectionView.frame = view.bounds

        // Do any additional setup after loading the view.
        setFlowLayout(view: collectionView)
        
        setNavigation()
//        collectionView.reloadData()
        
//        requestAccountList()
        accountToDisplay.delegate = self
        accountToDisplay.getAccountList()
        print(accountList.count)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let accountUseViewController = segue.destination as? AccountUseViewController else {
            return print("segue error from: Home Page => Account Use")
        }
//        print("view will prepare")
        accountUseViewController.accountInfo = selectedAccountInfo
    }
    
    func setNavigation(){

        let label = UILabel()
                   
        //for setting label constraints
        label.translatesAutoresizingMaskIntoConstraints = false
        
        //label custom(color: for recognize)
        label.text = fakeUser.userName
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

extension HomePageViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch(section){
        case 0:
            return fakeModel.count
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
            cell.cellSettings(index: indexPath.row)
            
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
    
    @IBAction func buttonPressed(_ sender: UIButton){
        
//        print("button pressed")

        self.selectedAccountInfo[0] = fakeModel[sender.tag].accountName
        self.selectedAccountInfo[1] = fakeModel[sender.tag].accountNum
        self.selectedAccountInfo[2] = fakeModel[sender.tag].accountBalance
        
    }
}
