//
//  HomePageNavgationItem.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/10.
//

import UIKit

class HomePageNavgationItem: UINavigationItem {
    
    @IBOutlet weak var myInfoBarButton: UIBarButtonItem!
    let label = UILabel()
    
    let userInfo = UserInformation().user
    
    func navigationSettings(){
        label.text = userInfo.userName
        label.textAlignment = .left
        
        titleView = label
        
    }
    
    func setConstraints(navigationBar: UINavigationBar){
        label.translatesAutoresizingMaskIntoConstraints = false
//        myInfoBarButton.customView?.translatesAutoresizingMaskIntoConstraints = false
//
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor, constant: 20),
        ])
    }

}
