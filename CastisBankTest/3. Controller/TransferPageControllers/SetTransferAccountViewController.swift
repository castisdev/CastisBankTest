//
//  SetTransferAccountViewController.swift
//  CastisBankTest
//
//  Created by 탁제원 on 2021/12/21.
//

import Foundation
import UIKit


class SetTransferAccountViewController: UIViewController{
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var putAccountTextField: UITextField!
    @IBOutlet weak var applyTrasferAccountButton: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let uikitFuncs = UIKitFuncs()
    
    let numberCell = NumberCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        setConstraints()
        displaySettings()
    }
    
    
    private func setConstraints(){
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        putAccountTextField.translatesAutoresizingMaskIntoConstraints = false
        applyTrasferAccountButton.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            putAccountTextField.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 50),
            putAccountTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            putAccountTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            putAccountTextField.heightAnchor.constraint(equalToConstant: 50),
            
            collectionView.topAnchor.constraint(equalTo: putAccountTextField.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionView.heightAnchor.constraint(equalToConstant: 300),
            
            applyTrasferAccountButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            applyTrasferAccountButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            applyTrasferAccountButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            applyTrasferAccountButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func displaySettings(){
        uikitFuncs.buttonSettings(button: cancelButton, title: "닫기", fontSize: 17, tintColor: .black)
        uikitFuncs.buttonSettings(button: applyTrasferAccountButton, title: "확인", fontSize: 17, tintColor: .black)
        
        applyTrasferAccountButton.backgroundColor = .lightGray
        applyTrasferAccountButton.layer.cornerRadius = 10.0
    }
    
    @IBAction func backToTransferButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
}

extension SetTransferAccountViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section{
        case 0...2:
            return 3
        case 3:
            return 3
        default:
            return 3
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: numberCell.cellIdentifier, for: indexPath) as? NumberCell else {
            return UICollectionViewCell()
        }
        
        cell.setConstraints()
        
        switch indexPath.section{
        case 0:
            cell.cellSettings(index: indexPath.row)
        case 1:
            cell.cellSettings(index: indexPath.row + 3)
        case 2:
            cell.cellSettings(index: indexPath.row + 6)
        case 3:
            cell.cellSettings(index: indexPath.row + 9)
        default:
            cell.cellSettings(index: indexPath.row)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 50
    }
}
