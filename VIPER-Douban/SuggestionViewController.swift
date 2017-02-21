//
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import UIKit
import RxSwift
import IGListKit

class SuggestionViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    let presenter = container.resolve(SuggestionPresenterProtocol.self)
    
    fileprivate var data: Array<Any> = []
    
    let collectionView: IGListCollectionView = {
        let view = IGListCollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var adaptor: IGListAdapter = {
        return IGListAdapter(updater: IGListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        adaptor.collectionView = collectionView
        adaptor.dataSource = self
        fetchMovie()
    }
    
    private func configUI() {
        automaticallyAdjustsScrollViewInsets = false
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor).isActive = true
    }
    
    private func fetchMovie() {
        self.presenter?.fetchMovies().subscribe(onNext: {
            self.data = [$0]
            self.adaptor.performUpdates(animated: false)
        }).addDisposableTo(disposeBag)
    }
}

extension SuggestionViewController: IGListAdapterDataSource {
    func objects(for listAdapter: IGListAdapter) -> [IGListDiffable] {
        guard let data = data as? [IGListDiffable] else {
            return []
        }
        return data
    }
    
    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
        if object is InTheatreAndComingSoonMovies {
            return HorizontalSectionController()
        }
        return IGListSectionController()
    }
    
    func emptyView(for listAdapter: IGListAdapter) -> UIView? {
        return nil
    }
}

