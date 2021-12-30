//
//  SetTransferAccountViewController.swift
//  CastisBankTest
//
//  Created by 탁제원 on 2021/12/21.
//

import Foundation
import UIKit

class SetAccountNumberViewController: UIViewController{
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var putAccountTextField: UITextField!
    @IBOutlet weak var applyTrasferAccountButton: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var sendingAccountInfo = ["보내는 계좌 이름", "보내는 계좌 번호"]
    var selectedAccountInfo = ["보낼 계좌 이름", "보낼 계좌 번호"]
    
    let uikitFuncs = UIKitFuncs()
    let colorchip = ColorChip()
    
    let numberCell = NumberCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        print("----------", sendingAccountInfo)
        
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
            
            applyTrasferAccountButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            applyTrasferAccountButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            applyTrasferAccountButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            applyTrasferAccountButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            applyTrasferAccountButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func displaySettings(){
        putAccountTextField.placeholder = "입금할 계좌번호 입력(- 포함해서)"
        
        putAccountTextField.backgroundColor = .systemGray6
        putAccountTextField.borderStyle = .none
        putAccountTextField.layer.cornerRadius = 10
        putAccountTextField.textAlignment = .center


        uikitFuncs.buttonSettings(button: cancelButton, title: "취소", fontSize: 17, tintColor: .black)
        uikitFuncs.buttonSettings(button: applyTrasferAccountButton, title: "확인", fontSize: 17, tintColor: .black)
        
        applyTrasferAccountButton.backgroundColor = .lightGray
        applyTrasferAccountButton.layer.cornerRadius = 10.0
    }
    
    @IBAction func backToTransferButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let setAmountViewController = segue.destination as? SetSendingAmountViewController else {
            return print("segue error: set account number -> set sending amount")
        }
        
        setAmountViewController.selectedAccountInfo = ["", putAccountTextField.text!]
        setAmountViewController.sendingAccountInfo = self.sendingAccountInfo
    }
}

extension SetAccountNumberViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
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
    
    //cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidth = view.bounds.width / 3 - 40
        let cellSize = CGSize(width: cellWidth , height: cellWidth - 35)
        
        return cellSize
    }
    
    //같은 섹션안의 아이템 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }

    //섹션 간 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let cellInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return cellInset
    }
    
    //셀이 선택 되었을 떄
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        switch indexPath.section{
        case 0:
            putAccountTextField.text?.append(contentsOf: numberCell.numbers[indexPath.row])
            return
        case 1:
            putAccountTextField.text?.append(contentsOf: numberCell.numbers[indexPath.row + 3])
        case 2:
            putAccountTextField.text?.append(contentsOf: numberCell.numbers[indexPath.row + 6])
        case 3:
            if indexPath.row == 0{
                putAccountTextField.text?.append(contentsOf: numberCell.numbers[9])
            }else if indexPath.row == 1{
                putAccountTextField.text?.append(contentsOf: numberCell.numbers[10])
            } else if putAccountTextField.text?.isEmpty == false && indexPath.row == 2{
                putAccountTextField.text?.removeLast()
            }
        default:
            return
        }
    }
    
}
