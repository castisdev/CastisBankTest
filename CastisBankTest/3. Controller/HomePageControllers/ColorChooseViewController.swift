//
//  ColorChooseViewController.swift
//  CastisBankTest
//
//  Created by 탁제원 on 2021/12/30.
//

import UIKit

class ColorChooseViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let colorCellIdetifier = "colorCell"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .blue
        
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    private func setConstraints(){
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

}

extension ColorChooseViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.colorCellIdetifier, for: indexPath) as? ColorCell else {
            return UICollectionViewCell()
        }
        
        cell.settingCell(index: indexPath.row)
        cell.setConstraints()
        
        return cell
    }
    
    
}
