//
//  MovieDetailInfoViewController.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 14/03/2017.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import UIKit

protocol MovieDetailInfoTouchBarDelegate: class {
    func handleTouchBarTouchedAction()
}

class MovieDetailInfoViewController: UIViewController {
    
    var scrollView = UIScrollView()
    var mainImageView = UIImageView()
    var touchBar = UIView()
    weak var touchBarDelegate: MovieDetailInfoTouchBarDelegate?
    
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
        
        touchBar.translatesAutoresizingMaskIntoConstraints = false
        touchBar.backgroundColor = UIColor.black
        touchBar.alpha = 0.3
        view.addSubview(touchBar)
        touchBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        touchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        touchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        touchBar.heightAnchor.constraint(equalToConstant: 44).isActive = true
        hideTouchBar()
        let tap = UITapGestureRecognizer(target: self, action: #selector(touchBarTapped))
        touchBar.addGestureRecognizer(tap)
    }
    
    func showTouchBar() {
        touchBar.isHidden = false
    }
    
    func hideTouchBar() {
        touchBar.isHidden = true
    }
    
    func touchBarTapped() {
        touchBarDelegate?.handleTouchBarTouchedAction()
    }
}
