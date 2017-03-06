//
//  MovieDetailViewController.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 3/6/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import UIKit
import Hero
import Kingfisher

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var originTitle: UILabel!
    
    var movieImageUrl: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isHeroEnabled = true
        view.heroModifiers = [.fade]
        navigationController?.navigationBar.isHidden = false
        imageView.heroID = movieImageUrl
        imageView.kf.setImage(with: URL(string: movieImageUrl))
    }
}
