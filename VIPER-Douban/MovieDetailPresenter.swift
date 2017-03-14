//
//  MovieDetailPresenter.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 13/03/2017.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import UIKit

struct MovieDetailPresenter {
    let numberOfItem: Int = 21
    let items = [
        UIImageView(image: UIImage(named: "1"))
    ]
    
    func getSize(by index: Int, width: CGFloat) -> CGSize {
        if index == 0 {
            return CGSize(width: width, height: width * 0.618)
        } else {
            let length = (width - 8) / 2
            return CGSize(width: length, height: length * 0.618)
        }
    }
}
