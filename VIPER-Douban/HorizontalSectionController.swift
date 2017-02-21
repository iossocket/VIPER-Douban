//
//  HorizontalSectionController.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 2/20/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import UIKit
import IGListKit

class HorizontalSectionController: IGListSectionController {
    
    fileprivate var data: InTheatreAndComingSoonMovies?
    
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
    }
    
    lazy var adapter: IGListAdapter = {
        let adapter = IGListAdapter(updater: IGListAdapterUpdater(),
                                    viewController: self.viewController,
                                    workingRangeSize: 0)
        adapter.dataSource = self
        return adapter
    }()
}

extension HorizontalSectionController: IGListSectionType {
    func numberOfItems() -> Int {
        return 1
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 150)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: EmbeddedCollectionViewCell.self, for: self, at: index) as! EmbeddedCollectionViewCell
        adapter.collectionView = cell.collectionView
        return cell
    }
    
    func didUpdate(to object: Any) {
        data = object as? InTheatreAndComingSoonMovies
    }
    
    func didSelectItem(at index: Int) {}
}

extension HorizontalSectionController: IGListAdapterDataSource {
    func objects(for listAdapter: IGListAdapter) -> [IGListDiffable] {
        guard let data = data else { return [] }
        return data.inTheatre
    }
    
    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
        return EmbeddedSectionController()
    }
    
    func emptyView(for listAdapter: IGListAdapter) -> UIView? {
        return nil
    }
}
