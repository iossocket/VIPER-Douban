//
//  TypeCell.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 2/23/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import UIKit

class TypeCell: UICollectionViewCell {
    private let inTheaterMargin: CGFloat = 16
    private let comingSoonMargin: CGFloat = 93
    
    @IBOutlet weak var marginLeft: NSLayoutConstraint!
    @IBOutlet weak var underLine: UIView!
    @IBOutlet weak var inTheatreButton: UIButton!
    @IBOutlet weak var comingSoonButton: UIButton!
    var handleTapped: ((_ type: MovieType) -> Void)?
    
    @IBAction func typeChanged(_ sender: UIButton) {
        if sender == inTheatreButton {
            handleTapped?(.inTheatre)
        } else {
            handleTapped?(.comingSoon)
        }
    }
    
    func changeUnderLinePositionby(movieType: MovieType) {
        self.layoutIfNeeded()
        UIView.animate(withDuration: 0.3) {
            self.marginLeft.constant = movieType == MovieType.inTheatre ? self.inTheaterMargin: self.comingSoonMargin
            self.layoutIfNeeded()
        }
    }
}
