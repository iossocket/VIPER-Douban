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
    
    var movieImageUrl: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configBackgroundUI()
    }
    
    private func configBackgroundUI() {
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.isHidden = false
        isHeroEnabled = true
        view.heroModifiers = [.fade]
        let backItem = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(back))
        backItem.image = UIImage(named: "back")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        navigationItem.leftBarButtonItem = backItem
    }
    
    func back() {
        _ = navigationController?.popViewController(animated: true)
    }
}
