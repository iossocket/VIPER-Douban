//
//  MovieDetailViewController.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 3/6/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import UIKit
import Hero

class MovieDetailViewController: UIViewController {

    let image: UIImageView = UIImageView()
    var id: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.isHidden = false
        view.heroModifiers = [.fade]
        
        isHeroEnabled = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.heroID = id
        
        view.addSubview(image)
        image.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        image.widthAnchor.constraint(equalToConstant: 100).isActive = true
        image.heightAnchor.constraint(equalToConstant: 120).isActive = true
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
    }
}
