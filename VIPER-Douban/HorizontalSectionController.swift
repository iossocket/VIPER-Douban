//
//  HorizontalSectionController.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 3/2/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import IGListKit

class HorizontalSectionController: IGListSectionController {
    
    var data: Top250Movies?
    
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
        supplementaryViewSource = self
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
        return CGSize(width: collectionContext!.containerSize.width, height: 180)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: EmbeddedCollectionViewCell.self, for: self, at: index) as! EmbeddedCollectionViewCell
        adapter.collectionView = cell.collectionView
        adapter.collectionView?.showsHorizontalScrollIndicator = false
        return cell
    }
    
    func didUpdate(to object: Any) {
        data = object as? Top250Movies
    }
    
    func didSelectItem(at index: Int) {}
}

extension HorizontalSectionController: IGListAdapterDataSource {
    func objects(for listAdapter: IGListAdapter) -> [IGListDiffable] {
        guard let movies = data?.movies else { return [] }
        return movies
    }
    
    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
        return EmbeddedSectionController()
    }
    
    func emptyView(for listAdapter: IGListAdapter) -> UIView? {
        return nil
    }
}

extension HorizontalSectionController: IGListSupplementaryViewSource {
    func supportedElementKinds() -> [String] {
        return [UICollectionElementKindSectionHeader]
    }
    
    func viewForSupplementaryElement(ofKind elementKind: String, at index: Int) -> UICollectionReusableView {
        let view = collectionContext?.dequeueReusableSupplementaryView(ofKind: elementKind, for: self, nibName: "CommonHeaderView", bundle: nil, at: index) as! CommonHeaderView
        return view
    }
    
    func sizeForSupplementaryView(ofKind elementKind: String, at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 40)
    }
}


