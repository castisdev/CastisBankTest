//
//  SetSendingAmountViewController.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/02.
//

import UIKit

class SetSendingAmountViewController: UIViewController {
    
    @IBOutlet weak var receiverAccountNameLabel: UILabel!
    @IBOutlet weak var amountOfMoneyTextField: UITextField!
    @IBOutlet weak var accountNameOfSendingButton: UIButton!
    @IBOutlet weak var numberCollectionView: UICollectionView!
    @IBOutlet weak var applyAmountOfMoneyButton: UIButton!
    
    let numberCell = NumberCell()
    
    let uikitFuncs = UIKitFuncs()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberCollectionView.delegate = self
        numberCollectionView.dataSource = self

        settings()
        setConstraints()
        
        // Do any additional setup after loading the view.
    }
    
    private func settings(){
        navigationItem.title = "테트트용 계좌"
        
        uikitFuncs.labelSettings(label: receiverAccountNameLabel, title: "8282-0200", size: 17, color: .darkGray)
        amountOfMoneyTextField.placeholder = "보낼 금액"
        amountOfMoneyTextField.borderStyle = .none
        amountOfMoneyTextField.layer.cornerRadius = 10
        
        uikitFuncs.buttonSettings(button: accountNameOfSendingButton, title: "테트트용 계좌(8282-0200)", fontSize: 17, tintColor: .black)
        accountNameOfSendingButton.backgroundColor = .lightGray
        
        applyAmountOfMoneyButton.backgroundColor = .lightGray
        applyAmountOfMoneyButton.layer.cornerRadius = 10
    }
    
    private func setConstraints(){
        receiverAccountNameLabel.translatesAutoresizingMaskIntoConstraints = false
        amountOfMoneyTextField.translatesAutoresizingMaskIntoConstraints = false
        accountNameOfSendingButton.translatesAutoresizingMaskIntoConstraints = false
        numberCollectionView.translatesAutoresizingMaskIntoConstraints = false
        applyAmountOfMoneyButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            receiverAccountNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            receiverAccountNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            amountOfMoneyTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            amountOfMoneyTextField.topAnchor.constraint(equalTo: receiverAccountNameLabel.bottomAnchor, constant: 100),
            amountOfMoneyTextField.heightAnchor.constraint(equalToConstant: 50),
            
            accountNameOfSendingButton.topAnchor.constraint(equalTo: amountOfMoneyTextField.bottomAnchor, constant: 100),
            accountNameOfSendingButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            accountNameOfSendingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            accountNameOfSendingButton.heightAnchor.constraint(equalToConstant: 20),
            
            numberCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            numberCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            numberCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            numberCollectionView.heightAnchor.constraint(equalToConstant: 150),
            
            applyAmountOfMoneyButton.topAnchor.constraint(equalTo: numberCollectionView.bottomAnchor, constant: 20),
            applyAmountOfMoneyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            applyAmountOfMoneyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            applyAmountOfMoneyButton.heightAnchor.constraint(equalToConstant: 30),
            applyAmountOfMoneyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }

}

extension SetSendingAmountViewController: UICollectionViewDelegate, UICollectionViewDataSource{
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
            amountOfMoneyTextField.text?.append(contentsOf: numberCell.numbers[indexPath.row])
            return
        case 1:
            amountOfMoneyTextField.text?.append(contentsOf: numberCell.numbers[indexPath.row + 3])
        case 2:
            amountOfMoneyTextField.text?.append(contentsOf: numberCell.numbers[indexPath.row + 6])
        case 3:
            if indexPath.row == 1{
                amountOfMoneyTextField.text?.append(contentsOf: numberCell.numbers[10])
            } else if amountOfMoneyTextField.text?.isEmpty == false && indexPath.row == 2{
                amountOfMoneyTextField.text?.removeLast()
            } else {
                print("selected cell which means nothing")
            }
        default:
            return
        }
    }
    
}
