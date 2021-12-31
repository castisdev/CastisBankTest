//
//  ColorChooseViewController.swift
//  CastisBankTest
//
//  Created by 탁제원 on 2021/12/30.
//

import UIKit

protocol selectedColorSendingDelegate{
    func colorSending(color: UIColor)
}

class ColorChooseViewController: UIViewController {
    
    @IBOutlet weak var applyColorButton: UIButton!
    @IBOutlet weak var accountNameLabel: UILabel!
    @IBOutlet weak var accountNumberLabel: UILabel!
    @IBOutlet weak var copyAccontNumberButton: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let colorCellIdetifier = "colorCell"
    let colorCell = ColorCell()
    let uikitFuns = UIKitFuncs()
    
    var cellColor: UIColor?
    var selectedIndexPath: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
//        collectionView.backgroundColor = .blue
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        setConstraints()
        settings()
        
        collectionView.allowsMultipleSelection = false
    }
    
    private func setConstraints(){
        applyColorButton.translatesAutoresizingMaskIntoConstraints = false
        accountNameLabel.translatesAutoresizingMaskIntoConstraints = false
        accountNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        copyAccontNumberButton.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            applyColorButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            applyColorButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            accountNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            accountNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        
            accountNumberLabel.topAnchor.constraint(equalTo: accountNameLabel.bottomAnchor, constant: 20),
            accountNumberLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            copyAccontNumberButton.topAnchor.constraint(equalTo: accountNameLabel.bottomAnchor, constant: 20),
            copyAccontNumberButton.leadingAnchor.constraint(equalTo: accountNumberLabel.trailingAnchor, constant: 20),
            copyAccontNumberButton.heightAnchor.constraint(equalToConstant: 30),
            copyAccontNumberButton.widthAnchor.constraint(equalToConstant: 100),
            
            
            collectionView.topAnchor.constraint(equalTo: accountNumberLabel.topAnchor, constant: 50),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func settings(){
        uikitFuns.buttonSettings(button: applyColorButton, title: "확인", fontSize: 17, tintColor: .black)
        uikitFuns.labelSettings(label: accountNameLabel, title: "계좌이름", size: 20, color: .black)
        uikitFuns.labelSettings(label: accountNumberLabel, title: "계좌 번호 ", size: 20, color: .black)
        uikitFuns.buttonSettings(button: copyAccontNumberButton, title: "복사하기", fontSize: 17, tintColor: .black)
    }
    @IBAction func pushApplyColorButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension ColorChooseViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 7
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.colorCellIdetifier, for: indexPath) as? ColorCell else {
            return UICollectionViewCell()
        }
        
        if indexPath.item == colorCell.colorChipArray.firstIndex(of: cellColor!){
            cell.isSelected = true
        }
        
//        selectedIndexPath = colorCell.colorChipArray.firstIndex(of: cellColor)
        
        cell.settingCell(index: indexPath.item)
        cell.setConstraints()
        cell.colorImageView.tag = indexPath.item
        
        collectionView.allowsMultipleSelection = false
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        self.selectedIndexPath = indexPath
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        self.selectedIndexPath = nil
    }
    
}
