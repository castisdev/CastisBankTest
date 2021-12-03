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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.frame = view.bounds
        
        setFlowLayout(view: collectionView)

        // Do any additional setup after loading the view.
    }
    
}

extension AccountUseViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: selectedAccountInfoCell.cellIdentifier, for: indexPath) as? SelectedAccountInfoCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.cellSettings()
        cell.setConstraints()
        
        return cell
    }
    
    func setFlowLayout(view: UICollectionView){
        
          //flowLayout
          let flowLayout = UICollectionViewFlowLayout()
          flowLayout.minimumLineSpacing = 10
          flowLayout.minimumInteritemSpacing = 20
          
          //cell Size
          let halfWidth = UIScreen.main.bounds.width
          flowLayout.itemSize = CGSize(width: halfWidth, height: halfWidth / 2 + 30)
          
          view.collectionViewLayout = flowLayout
      }
 
}
