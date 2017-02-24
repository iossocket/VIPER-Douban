//
//  MovieItemCell.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 2/20/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import UIKit

class MovieItemCell: UICollectionViewCell {
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.black
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        self.contentView.addSubview(imageView)
        return imageView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
}
