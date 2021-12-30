//
//  ColorCell.swift
//  CastisBankTest
//
//  Created by 탁제원 on 2021/12/30.
//

import UIKit

class ColorCell: UICollectionViewCell {
    
    @IBOutlet weak var colorImageView: UIImageView!
    
    let colorChip = ColorChip()
    
    func settingCell(index: Int){
        
        let colorChipArray = [
            colorChip.kakaoYello11, colorChip.kakaoHotPink12, colorChip.kakaoRed13, colorChip.kakaoPurple14,
            colorChip.kakaoDeepPink21, colorChip.kakaoBrown22, colorChip.kakaoBabyPurple23, colorChip.kakaoOrange24,
            colorChip.kakaoGreenBlue31, colorChip.kakaoLightGreen32, colorChip.kakaoGreen33, colorChip.kakaoDarkMint34,
            colorChip.kakaoDarkGreenGray41, colorChip.kakaoDarkBlue42, colorChip.kakaoRainyBlue43, colorChip.kakaoSunnyBlue44,
            colorChip.kakaoBluePurple51, colorChip.kakaoDarkBlueGray52, colorChip.kakaoGray53, colorChip.kakaoBlackBrown54,
            colorChip.kakaoSkyBlue61, colorChip.kakaoBabyPink62, colorChip.kakaoMintGreen63, colorChip.kakaomintBlue64,
            colorChip.kakaoBlueGray71, colorChip.kakaoBeige72, colorChip.kakaoPinkBeige73, colorChip.kakaoKhaki74
        ]
        
        colorImageView.backgroundColor = colorChipArray[index]
        
        colorImageView.layer.cornerRadius = 45
    }
    
    func setConstraints(){
        colorImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            colorImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            colorImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            colorImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            colorImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
        ])
    }
}
