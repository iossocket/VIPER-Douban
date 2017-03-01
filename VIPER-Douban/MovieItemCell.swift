//
//  MovieItemCell.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 2/20/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import UIKit
import Cosmos

class MovieItemCell: UICollectionViewCell {
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let stars = CosmosView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 242.0/255, green: 242.0/255, blue: 242.0/255, alpha: 1)
        configImage()
        configTitle()
        configStar()
    }
    
    private func configImage() {
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 130).isActive = true
    }
    
    private func configTitle() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.systemFont(ofSize: 14)
    }
    
    private func configStar() {
        stars.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stars)
        stars.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        stars.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        stars.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
        stars.settings.starSize = 12
        stars.settings.textFont = UIFont.systemFont(ofSize: 10)
        stars.settings.starMargin = 0
        stars.isUserInteractionEnabled = false
    }
    
    func configStars(star: Float) {
        stars.rating = Double(star)
        stars.text = String(format: "%.1f", star)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
