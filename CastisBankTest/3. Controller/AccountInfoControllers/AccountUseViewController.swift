//
//  AccountUseViewController.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/02.
//

import UIKit

class AccountUseViewController: UIViewController {
    
    
    //내비게이션 컬러 바꾸기

    @IBOutlet weak var collectionView: UICollectionView!
    
    let selectedAccountInfoCell = SelectedAccountInfoCollectionViewCell()
    let searchInfoCell = SearchInformationCollectionViewCell()
    let historyCell = TransferHistoryCollectionViewCell()
    
    let colorchip = ColorChip()
    let fakeModel = AccountModel().usedInformation
    let uikitFuncs = UIKitFuncs()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.frame = view.bounds
        
        setFlowLayout(view: collectionView)
        setNavigation()

        // Do any additional setup after loading the view.
    }
    
    func setNavigation(){
        self.title = "이전 계좌 이름"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.isTranslucent = true
        
        //vieDidLoad에 넣으니 계속 남아있음미
//        self.navigationController?.navigationBar.backgroundColor = colorchip.kakaoYello
        
        self.navigationController?.navigationBar.titleTextAttributes = [
            .font: UIFont.boldSystemFont(ofSize: 20),
        ]
        
    }
    
}

extension AccountUseViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
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
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: selectedAccountInfoCell.cellIdentifier, for: indexPath) as? SelectedAccountInfoCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        guard let searchCell = collectionView.dequeueReusableCell(withReuseIdentifier: searchInfoCell.cellIdentifier, for: indexPath) as? SearchInformationCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        guard let historyCell = collectionView.dequeueReusableCell(withReuseIdentifier: historyCell.cellIdentifier, for: indexPath) as? TransferHistoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        switch(indexPath.section){
        case 0:
            cell.cellSettings()
            cell.setConstraints()
            return cell
        case 1:
            searchCell.cellSettings(month: "1개월", type: "전체", order: "최신순")
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
    
    func setFlowLayout(view: UICollectionView){
        
          //flowLayout
          let flowLayout = UICollectionViewFlowLayout()
          flowLayout.minimumLineSpacing = 0
          flowLayout.minimumInteritemSpacing = 20
        
          view.collectionViewLayout = flowLayout
      }
 
}
