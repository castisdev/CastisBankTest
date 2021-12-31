//
//  MainTabBarController.swift
//  CastisBankTest
//
//  Created by 탁제원 on 2021/12/31.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate{
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let item1 = HomePageViewController()
            
        let icon1 = UITabBarItem(title: "홈", image: UIImage(named: "house"), selectedImage: UIImage(named: "house.fill"))
        let icon2 = UITabBarItem(title: "프로필", image: UIImage(named: "person"), selectedImage: UIImage(named: "person.fill"))
            
        item1.tabBarItem = icon1
            
        let controllers = [item1]
        self.viewControllers = controllers
    }
}
