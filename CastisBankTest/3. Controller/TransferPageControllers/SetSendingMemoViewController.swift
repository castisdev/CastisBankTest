//
//  SetSendingMemoViewController.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/02.
//

import UIKit

class SetSendingMemoViewController: UIViewController {

    @IBOutlet weak var sendingAmountLabel: UILabel!
    @IBOutlet weak var sendingAccountInfoButton: UIButton!
    
    @IBOutlet weak var historyMemoTextField: UITextField!
    @IBOutlet weak var applyMemoButton: UIButton!
    
    @IBOutlet weak var goToHomeBarButton: UIBarButtonItem!
    
    let uikitFuncs = UIKitFuncs()
    let skills = DetailFuncs()

    var selectedAccountInfo = ["보낼 계좌 이름", "보낼 계좌 번호"]
    var sendingAccountInfo = ["보내는 계좌 이름", "보내는 계좌 번호"]
    var sendingAmount = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settings()
        setConstraints()
        setNavigation()
        
        historyMemoTextField.delegate = self
        
//        self.title = selectedAccountInfo[0]
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        self.setNavigation()
    }
    
    private func setNavigation(){
        
//        let attributedAccountNumber = NSMutableAttributedString(string: selectedAccountInfo[1], attributes: [
//            .font: UIFont.systemFont(ofSize: 10),
//            .foregroundColor = UIColor.lightGray
//        ])
        
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.text = "\(selectedAccountInfo[0])\n\(selectedAccountInfo[1])"
        self.navigationItem.titleView = label
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func settings(){
        
        let easySendingAmount = skills.makeMoneyAmountEasy(amount: Int(sendingAmount)!)
        uikitFuncs.labelSettings(label: self.sendingAmountLabel, title: easySendingAmount, size: 30, color: .black)
        
        let sendingAccountTitle = "\(sendingAccountInfo[0])(\(sendingAccountInfo[1]))"
        uikitFuncs.buttonSettings(button: self.sendingAccountInfoButton, title: sendingAccountTitle, fontSize: 17, tintColor: .black)
        sendingAccountInfoButton.backgroundColor = .systemGray6
        sendingAccountInfoButton.layer.cornerRadius = 10
        
        self.historyMemoTextField.placeholder = "메모 작성"
        self.historyMemoTextField.layer.cornerRadius = 10
        
        uikitFuncs.buttonSettings(button: self.applyMemoButton, title: "확인", fontSize: 17, tintColor: .black)
        
        goToHomeBarButton.title = "취소"
    }
    
    private func setConstraints(){
        self.sendingAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        self.sendingAccountInfoButton.translatesAutoresizingMaskIntoConstraints = false
        self.historyMemoTextField.translatesAutoresizingMaskIntoConstraints = false
        self.applyMemoButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.sendingAmountLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            self.sendingAmountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            self.sendingAccountInfoButton.topAnchor.constraint(equalTo: self.sendingAmountLabel.bottomAnchor, constant: 100),
            self.sendingAccountInfoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            self.sendingAccountInfoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            self.sendingAccountInfoButton.heightAnchor.constraint(equalToConstant: 50),
            self.sendingAccountInfoButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            self.historyMemoTextField.topAnchor.constraint(equalTo: self.sendingAccountInfoButton.bottomAnchor, constant: 20),
            self.historyMemoTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.historyMemoTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            self.historyMemoTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            self.historyMemoTextField.heightAnchor.constraint(equalToConstant: 50),
            
//            self.applyMemoButton.topAnchor.constraint(equalTo: self.historyMemoTextField.bottomAnchor, constant: 20),
            self.applyMemoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            self.applyMemoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            self.applyMemoButton.heightAnchor.constraint(equalToConstant: 50),
            self.applyMemoButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let seekConsentViewController = segue.destination as? SeekTransferConsentViewController else {
            return print("segue error : set memo -> seek consent")
        }
        
        seekConsentViewController.receivingAccountInfo = self.selectedAccountInfo
        seekConsentViewController.sendingAmount = self.sendingAmount
        seekConsentViewController.sendingAccountInfo = self.sendingAccountInfo
        seekConsentViewController.sendingMemo = historyMemoTextField.text!
    }
    @IBAction func goToHomeButtonPressed(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}

extension SetSendingMemoViewController: UITextFieldDelegate {
    @objc func keyboardWillShow(_ sender: Notification){
        self.view.frame.origin.y = -50
    }
    
    @objc func keyboardWillHide(_ sender: Notification){
        self.view.frame.origin.y = 0
    }
}
