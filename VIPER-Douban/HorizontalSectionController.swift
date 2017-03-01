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
    
    fileprivate var presenter = container.resolve(HorizontalSectionPresenterProtocol.self)!
    
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
        return 2
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        if index == 0 {
            return CGSize(width: collectionContext!.containerSize.width, height: 50)
        }
        return CGSize(width: collectionContext!.containerSize.width, height: 180)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        if index == 1 {
            let cell = collectionContext!.dequeueReusableCell(of: EmbeddedCollectionViewCell.self, for: self, at: index) as! EmbeddedCollectionViewCell
            adapter.collectionView = cell.collectionView
            adapter.collectionView?.showsHorizontalScrollIndicator = false
            return cell
        }
        let cell = collectionContext!.dequeueReusableCell(withNibName: "TypeCell", bundle: nil, for: self, at: 0) as! TypeCell
        cell.handleTapped = {[weak self] type in
            self?.currentTypeChanged(type: type)
        }
        return cell
    }
    
    func didUpdate(to object: Any) {
        presenter.configInTheatreAndComingSoonMovies(movies: object as? InTheatreAndComingSoonMovies)
    }
    
    func didSelectItem(at index: Int) {}
    
    private func currentTypeChanged(type: MovieType) {
        if presenter.shouldChangeCurrent(type: type) {
            adapter.performUpdates(animated: true)
            guard let cell = collectionContext?.cellForItem(at: 0, sectionController: self) as? TypeCell else { return }
            cell.changeUnderLinePositionby(movieType: type)
        }
    }
}

extension HorizontalSectionController: IGListAdapterDataSource {
    func objects(for listAdapter: IGListAdapter) -> [IGListDiffable] {
        guard let data = presenter.currentMovies as? Array<DisplayMovie> else { return [] }
        return data
    }
    
    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
        return EmbeddedSectionController()
    }
    
    func emptyView(for listAdapter: IGListAdapter) -> UIView? {
        return nil
    }
}
