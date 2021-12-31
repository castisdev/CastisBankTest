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
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var applyAmountOfMoneyButton: UIButton!
    
    @IBOutlet weak var goToHomeBarButton: UIBarButtonItem!
    
    let numberCell = NumberCell()
    let uikitFuncs = UIKitFuncs()
    
    var selectedAccountInfo = ["보낼 계좌 이름", "보낼 계좌 번호"]
    var sendingAccountInfo = ["보내는 계좌 이름", "보내는 계좌 번호"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("---------amount view did load-----------")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.title = selectedAccountInfo[0]

        settings()
        setConstraints()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        self.navigationController?.isNavigationBarHidden = false
//
//        if amountOfMoneyTextField.text?.isEmpty == true {
//            applyAmountOfMoneyButton.isEnabled = false
//        }
//    }
//
    private func settings(){
        self.amountOfMoneyTextField.isUserInteractionEnabled = false
        
        uikitFuncs.labelSettings(label: self.receiverAccountNameLabel, title: selectedAccountInfo[1], size: 17, color: .darkGray)
        
        self.amountOfMoneyTextField.placeholder = "보낼 금액"
        self.amountOfMoneyTextField.borderStyle = .none
        self.amountOfMoneyTextField.layer.cornerRadius = 10
        self.amountOfMoneyTextField.textAlignment = .center
        
        let sendingAccountTitle = "\(sendingAccountInfo[0])(\(sendingAccountInfo[1]))"
        uikitFuncs.buttonSettings(button: self.accountNameOfSendingButton, title: sendingAccountTitle, fontSize: 17, tintColor: .black)
        self.accountNameOfSendingButton.backgroundColor = .lightGray
        
        self.applyAmountOfMoneyButton.backgroundColor = .lightGray
        self.applyAmountOfMoneyButton.layer.cornerRadius = 10
        
        self.goToHomeBarButton.title = "취소"
    }
    
    private func setConstraints(){
        self.receiverAccountNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.amountOfMoneyTextField.translatesAutoresizingMaskIntoConstraints = false
        self.accountNameOfSendingButton.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.applyAmountOfMoneyButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            receiverAccountNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            receiverAccountNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            amountOfMoneyTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            amountOfMoneyTextField.topAnchor.constraint(equalTo: receiverAccountNameLabel.bottomAnchor, constant: 100),
            amountOfMoneyTextField.heightAnchor.constraint(equalToConstant: 50),
            
            accountNameOfSendingButton.topAnchor.constraint(equalTo: amountOfMoneyTextField.bottomAnchor, constant: 100),
            accountNameOfSendingButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            accountNameOfSendingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            accountNameOfSendingButton.heightAnchor.constraint(equalToConstant: 50),
            
            collectionView.topAnchor.constraint(equalTo: accountNameOfSendingButton.bottomAnchor, constant: 20),
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            numberCollectionView.heightAnchor.constraint(equalToConstant: 300),
            
            applyAmountOfMoneyButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            applyAmountOfMoneyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            applyAmountOfMoneyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            applyAmountOfMoneyButton.heightAnchor.constraint(equalToConstant: 50),
            applyAmountOfMoneyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let setMemoViewController = segue.destination as? SetSendingMemoViewController else {
            return print("segue error : set amount -> set memo")
        }
        
        setMemoViewController.sendingAmount = self.amountOfMoneyTextField.text!
        setMemoViewController.selectedAccountInfo = self.selectedAccountInfo
        setMemoViewController.sendingAccountInfo = self.sendingAccountInfo
    }
    @IBAction func goToHomeButtonPressed(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}

extension SetSendingAmountViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
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
        let cellHeight = collectionView.bounds.height / 4
        let cellSize = CGSize(width: cellWidth , height: cellHeight)
        
        return cellSize
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

//extension SetSendingAmountViewController: UITextFieldDelegate{
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        if self.amountOfMoneyTextField.text?.isEmpty == false {
//            applyAmountOfMoneyButton.isEnabled = true
//        } else{
//            applyAmountOfMoneyButton.isEnabled = false
//        }
//    }
//}\
