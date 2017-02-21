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
        return CGSize(width: 100, height: height)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: CenterLabelCell.self, for: self, at: index) as! CenterLabelCell
        var url = ""
        if let movie = data {
            url = movie.imageUrl
        }
        cell.imageView.kf.setImage(with: URL(string: url))
        cell.backgroundColor = UIColor(red: 237/255.0, green: 73/255.0, blue: 86/255.0, alpha: 1)
        return cell
    }
    
    func didUpdate(to object: Any) {
        data = object as? DisplayMovie
    }
    
    func didSelectItem(at index: Int) {}
}
