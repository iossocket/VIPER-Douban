//
//  EmbeddedSectionController.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 2/20/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import UIKit
import IGListKit
import Kingfisher

class EmbeddedSectionController: IGListSectionController, IGListSectionType {
    
    var data: DisplayMovie?
    
    override init() {
        super.init()
        self.inset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
    }
    
    func numberOfItems() -> Int {
        return 1
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        let height = collectionContext?.containerSize.height ?? 0
        return CGSize(width: 110, height: height)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: MovieItemCell.self, for: self, at: index) as! MovieItemCell
        guard let movie = data else {
            return cell
        }
        cell.imageView.kf.setImage(with: URL(string: movie.imageUrl))
        cell.imageView.heroID = movie.imageUrl
        cell.titleLabel.text = movie.title
        cell.configStars(star: movie.star)
        return cell
    }
    
    func didUpdate(to object: Any) {
        data = object as? DisplayMovie
    }
    
    func didSelectItem(at index: Int) {
        let detail = MovieDetailViewController()
        detail.image.kf.setImage(with: URL(string: data!.imageUrl))
        detail.id = data!.imageUrl
        viewController?.show(detail, sender: nil)
    }
}
