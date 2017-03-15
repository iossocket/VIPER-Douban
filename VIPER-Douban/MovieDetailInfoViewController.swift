//
//  MovieDetailInfoViewController.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 14/03/2017.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import UIKit

class MovieDetailInfoViewController: UIViewController {
    
    var scrollView = UIScrollView()
    var mainImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        let holderView = UIView()
        holderView.backgroundColor = UIColor.clear
        holderView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(holderView)
        holderView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        holderView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        holderView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        holderView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        holderView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        holderView.heightAnchor.constraint(equalToConstant: view.bounds.width * 0.618).isActive = true
        
        let holderView2 = UIView()
        holderView2.backgroundColor = UIColor.white
        holderView2.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(holderView2)
        holderView2.topAnchor.constraint(equalTo: holderView.bottomAnchor).isActive = true
        holderView2.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        holderView2.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        holderView2.heightAnchor.constraint(equalToConstant: 900).isActive = true
        holderView2.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
//        mainImageView.translatesAutoresizingMaskIntoConstraints = false
//        scrollView.addSubview(mainImageView)
        
    }
}
