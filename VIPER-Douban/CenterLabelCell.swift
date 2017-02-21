//
//  CenterLabelCell.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 2/20/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import UIKit

class CenterLabelCell: UICollectionViewCell {
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        self.contentView.addSubview(imageView)
        return imageView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
}
