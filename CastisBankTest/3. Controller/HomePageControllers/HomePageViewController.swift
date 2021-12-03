//
//  HomePageViewController.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/02.
//

import UIKit

class HomePageViewController: UIViewController {
    
    //connect collection view with storyboard
    @IBOutlet weak var collectionView: UICollectionView!
    
    let accountInfoCell = AccountInfoCollectionViewCell()
    let editAccountCell = EditAccountOrderCollectionViewCell()
    
    let fakeModel = AccountModel().mainCellInformation
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        //collectionView size 설정
        collectionView.frame = view.bounds

        // Do any additional setup after loading the view.
        
        setFlowLayout(view: collectionView)
        
        collectionView.reloadData()
    }
}

extension HomePageViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fakeModel.count + 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: accountInfoCell.cellIdentifier, for: indexPath) as? AccountInfoCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        guard let editCell = collectionView.dequeueReusableCell(withReuseIdentifier: editAccountCell.cellIdentifier, for: indexPath) as? EditAccountOrderCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        //마지막 셀은 edit.. 이거 좀 고쳐야 할듯 ㅠㅠ
        if (indexPath.row == fakeModel.count){
            editCell.cellSettings()
            editCell.setConstraints()
            return editCell
        } else {
            cell.cellSettings(index: indexPath.row)
            cell.setConstraints()
        
            return cell
            
        }
    }
    
    public func setFlowLayout(view: UICollectionView){
        
        //flowLayout
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 20
        
        //cell Size
        let halfWidth = UIScreen.main.bounds.width
        flowLayout.itemSize = CGSize(width: halfWidth - 40, height: halfWidth / 2)
        
        view.collectionViewLayout = flowLayout
    }

}
