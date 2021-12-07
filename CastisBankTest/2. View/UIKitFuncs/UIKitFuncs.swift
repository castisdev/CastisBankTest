//
//  UIKitFuncs.swift
//  CastisBankTest
//
//  Created by Tak_iMac on 2021/12/03.
//

import UIKit

class UIKitFuncs {
    
    //레이블 일괄 세팅
    func labelSettings(label: UILabel, title: String, size: CGFloat, color: UIColor){
        label.text = title
        label.textColor = color
        label.font = UIFont.systemFont(ofSize: size)
        label.textAlignment = .left
    }
    
    //버튼 일괄 세팅
    func buttonSettings(button: UIButton, title: String, fontSize: CGFloat, tintColor: UIColor) {
//        button.titleLabel?.tintColor = color
        button.setTitle(title, for: .normal)
        button.setTitleColor(tintColor, for: .normal)
        button.contentHorizontalAlignment = .center
        button.contentVerticalAlignment = .center
    }
    
    //별 모양 세팅
    func starSetting(imageView: UIImageView, onImage: String, offImage: String, color: UIColor, size: CGFloat, cellStatus: Bool){
        imageView.tintColor = color
        imageView.frame.size = CGSize(width: size, height: size)
        imageView.contentMode = .scaleToFill
        
        if (cellStatus == true) {
            imageView.image = UIImage(systemName: onImage)
        } else {
            imageView.image = UIImage(systemName: offImage)
        }
    }
    
    //segment 세팅
    func segmentSetting(segment: UISegmentedControl, items: [String]){
        
//        let segment = UISegmentedControl(items: items)
        
        //remove default segments
        segment.removeAllSegments()
        
        for i in 0...items.count - 1 {
            segment.insertSegment(withTitle: items[i], at: i, animated: true)
        }
        
        
    }
    
    
    //cell size
    func cellSizeSetting(widthPadding: CGFloat, heightRatio: CGFloat) -> CGSize{
        
        let halfWidth = UIScreen.main.bounds.width
        return CGSize(width: halfWidth - widthPadding, height: halfWidth / heightRatio)
    }
}
