//
//  ActivitySectionController.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 2/28/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import UIKit
import IGListKit

class ActivitySectionController: IGListSectionController, IGListSectionType {
    
    override init() {
        super.init()
    }
    
    func numberOfItems() -> Int {
        return 1
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        let width = collectionContext?.containerSize.width ?? 0
        return CGSize(width: width, height: 60)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(withNibName: "ActivityCell", bundle: nil, for: self, at: index)
        return cell
    }
    
    func didUpdate(to object: Any) {
    }
    
    func didSelectItem(at index: Int) {}
}
