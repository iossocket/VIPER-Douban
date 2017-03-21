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
    
    var collectionView: UICollectionView!
    let presenter = container.resolve(MovieDetailPresenterProtocol.self)
    var infoVC: MovieDetailInfoViewController!
    var headerImageScrollView: UIScrollView!
    var top: NSLayoutConstraint!
    var bottom: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configBackgroundUI()
        configCollectionView()
        configHeaderImageScrollView()
        configChildViewController()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    func back() {
        _ = navigationController?.popViewController(animated: true)
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
    
    private func configHeaderImageScrollView() {
        headerImageScrollView = UIScrollView()
        headerImageScrollView.backgroundColor = UIColor.lightGray
        headerImageScrollView.tag = 1000
        headerImageScrollView.delegate = self
        headerImageScrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerImageScrollView)
        headerImageScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        headerImageScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        headerImageScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        headerImageScrollView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor).isActive = true
        
        let headerImageView = UIImageView(image: UIImage(named: "1"))
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
        headerImageView.contentMode = UIViewContentMode.scaleAspectFill
        headerImageScrollView.addSubview(headerImageView)
        headerImageView.topAnchor.constraint(equalTo: headerImageScrollView.topAnchor).isActive = true
        headerImageView.leadingAnchor.constraint(equalTo: headerImageScrollView.leadingAnchor).isActive = true
        headerImageView.trailingAnchor.constraint(equalTo: headerImageScrollView.trailingAnchor).isActive = true
        headerImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        headerImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        headerImageView.heightAnchor.constraint(equalToConstant: view.bounds.width * 0.618).isActive = true
        headerImageScrollView.bottomAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: 600).isActive = true
    }
    
    private func configChildViewController() {
        infoVC.touchBarDelegate = self
        infoVC.scrollView.tag = 1001
        infoVC.scrollView.delegate = self
        addChildViewController(infoVC)
        infoVC.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(infoVC.view)
        top = infoVC.view.topAnchor.constraint(equalTo: view.topAnchor)
        bottom = infoVC.view.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor)
        top.isActive = true
        bottom.isActive = true
        
        infoVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        infoVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        infoVC.didMove(toParentViewController: self)
    }
}

extension MovieDetailViewController {
    convenience init(imageUrl: String, id: String) {
        self.init()
        self.infoVC = MovieDetailInfoViewController(imageUrl: imageUrl, id: id)
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
        return presenter!.getSize(by: indexPath.item, width: collectionView.bounds.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}

extension MovieDetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.tag == 1000 {
            if scrollView.contentOffset.y < 0 {
                scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
            }
        } else if scrollView.tag == 1001 {
            headerImageScrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentOffset.y), animated: false)
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView.tag == 1001 && scrollView.contentOffset.y < -20 {
            view.layoutIfNeeded()
            self.top.constant = UIScreen.main.bounds.height - 44
            self.bottom.constant = UIScreen.main.bounds.height - 44
            UIView.animate(withDuration: 0.3, animations: { 
                self.view.layoutIfNeeded()
            }, completion: { _ in
                self.headerImageScrollView.isHidden = true
                self.infoVC.showTouchBar()
            })
        }
    }
}

extension MovieDetailViewController: MovieDetailInfoTouchBarDelegate {
    func handleTouchBarTouchedAction() {
        view.layoutIfNeeded()
        self.top.constant = 0
        self.bottom.constant = 0
        self.infoVC.hideTouchBar()
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        }, completion: { _ in
            self.headerImageScrollView.isHidden = false
        })
    }
}
