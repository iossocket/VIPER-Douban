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
    var collectionView: UICollectionView!
    let presenter = MovieDetailPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configBackgroundUI()
        configCollectionView()
    }
    
    private func configBackgroundUI() {
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.isHidden = false
        isHeroEnabled = true
        view.heroModifiers = [.fade]
        let backItem = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(back))
        backItem.image = UIImage(named: "back")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        navigationItem.leftBarButtonItem = backItem
        automaticallyAdjustsScrollViewInsets = false
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    func back() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    private func configCollectionView() {
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor).isActive = true
        collectionView.register(MovieGallaryCollectionViewCell.self, forCellWithReuseIdentifier: "GallaryCell")
    }
}

extension MovieDetailViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 11
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GallaryCell", for: indexPath) as! MovieGallaryCollectionViewCell
        if indexPath.item == 0 {
            cell.imageView.image = UIImage(named: "1")
        }
        cell.contentView.backgroundColor = UIColor.red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return presenter.getSize(by: indexPath.item, width: collectionView.bounds.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}
