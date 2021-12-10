//
//  AccountUseViewController.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/02.
//

import UIKit

class AccountUseViewController: UIViewController {
    
    //MARK: - declare instances
    @IBOutlet weak var collectionView: UICollectionView!
    
    let selectedAccountInfoCell = SelectedInfoCell()
    let searchInfoCell = SelectedFilterCell()
    let historyCell = TransferHistoryCell()
    
    let headerIdentifier = "header"
    let footerIdentifier = "footer"
    
    let colorchip = ColorChip()
    let fakeModel = AccountModel().usedInformation
    let uikitFuncs = UIKitFuncs()

    //filter: default value
    var selectedInfo = ["1개월", "전체", "최신순"]
    
    //accountName
    var accountInfo = ["계좌 이름", "계좌 번호", "계좌 잔액"]
    
    //MARK: - VC life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        setInfoViewController.delegate = self
//        collectionView.backgroundColor = colorchip.kakaoYello
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.frame = view.bounds
        
        setFlowLayout(view: collectionView)
        setNavigation()
    }
    
    //MARK: - navigation settings
    //navigation bar settingㄷ
    func setNavigation(){
        self.title = accountInfo[0]
//        navigationController?.navigationBar.backgroundColor = colorchip.kakaoYello
//        navigationController?.navigationBar.barTintColor = colorchip.kakaoYello
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.isTranslucent = true
        
        //vieDidLoad에 넣으니 계속 남아있음미
//        self.navigationController?.navigationBar.backgroundColor = colorchip.kakaoYello
        
        self.navigationController?.navigationBar.titleTextAttributes = [
            .font: UIFont.boldSystemFont(ofSize: 20),
        ]
        
    }
    
    //prepare information before present next vc that is modal
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let setInfoViewController = segue.destination as? SetInformationViewController else {
            return print("segue error")
        }
        setInfoViewController.receivedInfo = selectedInfo
        setInfoViewController.delegate = self
    }
}

//MARK: - about cell
extension AccountUseViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    //number of section
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    //number of cells in each section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch(section){
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return fakeModel.count
        default:
            return 0
        }
    }
    
    //setting cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: selectedAccountInfoCell.cellIdentifier, for: indexPath) as? SelectedInfoCell else {
            return UICollectionViewCell()
        }
        
        guard let searchCell = collectionView.dequeueReusableCell(withReuseIdentifier: searchInfoCell.cellIdentifier, for: indexPath) as? SelectedFilterCell else {
            return UICollectionViewCell()
        }
        
        guard let historyCell = collectionView.dequeueReusableCell(withReuseIdentifier: historyCell.cellIdentifier, for: indexPath) as? TransferHistoryCell else {
            return UICollectionViewCell()
        }
        
        switch(indexPath.section){
        case 0:
            cell.cellSettings(number: accountInfo[1], balance: accountInfo[2])
            cell.setConstraints()
            return cell
        case 1:
            print("setting cell")
            searchCell.cellSettings(month: selectedInfo[0], type: selectedInfo[1], order: selectedInfo[2])
            searchCell.setConstraints()
            return searchCell
        case 2:
            historyCell.cellSettings(index: indexPath.row)
            historyCell.setConstraints()
            return historyCell
        default:
            return cell
        }
    }
    
    
    //cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch(indexPath.section){
        case 0:
            return uikitFuncs.cellSizeSetting(widthPadding: 0, heightRatio: 2)
        case 1:
            return uikitFuncs.cellSizeSetting(widthPadding: 0, heightRatio: 7)
        case 2:
            return uikitFuncs.cellSizeSetting(widthPadding: 0, heightRatio: 5)
        default:
            return CGSize(width: 0, height: 0)
        }
    }
    
    //cell inset
    func setFlowLayout(view: UICollectionView){
        
          //flowLayout
          let flowLayout = UICollectionViewFlowLayout()
          flowLayout.minimumLineSpacing = 0
          flowLayout.minimumInteritemSpacing = 20
        
          view.collectionViewLayout = flowLayout
    }
    
    
    //이것도 안됨.
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind{
        case UICollectionView.elementKindSectionHeader :
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath)
            headerView.backgroundColor = colorchip.kakaoYello
            return headerView
        case UICollectionView.elementKindSectionFooter:
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerIdentifier, for: indexPath)
            footerView.backgroundColor = colorchip.kakaoKhaki
            return footerView
        default:
            return UICollectionReusableView()
    
        }
    }
}

//MARK: - use custom protocol
extension AccountUseViewController: SendUpDateDelegate {
    func sendUpdate(selectedData: [String]) {
        
        print(selectedData)
        
        for s in 0...2{
            self.selectedInfo[s] = selectedData[s]
        }
        
        print(selectedInfo)
        self.collectionView.reloadData()
    }
}

