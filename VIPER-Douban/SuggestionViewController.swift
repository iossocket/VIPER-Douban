//
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import UIKit
import RxSwift
import IGListKit

class SuggestionViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    let presenter = container.resolve(SuggestionPresenterProtocol.self)
    
    fileprivate var data: Array<Any> = ["activity"]
    
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
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor).isActive = true
        
        collectionView.contentInset = UIEdgeInsets(top: 200, left: 0, bottom: 0, right: 0)
        let header = Bundle.main.loadNibNamed("HeaderView", owner: nil, options: nil)?.first as! HeaderView
        header.translatesAutoresizingMaskIntoConstraints = false
        collectionView.addSubview(header)
        
        let headerAnchor = header.topAnchor.constraint(equalTo: view.topAnchor)
        headerAnchor.priority = 999
        headerAnchor.isActive = true
        header.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor).isActive = true
        header.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        header.bottomAnchor.constraint(equalTo: collectionView.topAnchor).isActive = true
        header.heightAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
        header.config(images: ["1", "2", "3"])
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isHidden = true
        
        let search = SearchHeaderView.loadViewFromNib()
        view.addSubview(search)
        search.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        search.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        search.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        search.heightAnchor.constraint(equalToConstant: 64).isActive = true
    }
    
    private func fetchMovie() {
        self.presenter?.fetchMovies().subscribe(onNext: {
            self.data.insert($0.0, at: 1)
            self.data.insert($0.1, at: 2)
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
            return HorizontalTabSectionController()
        } else if object is Top250Movies {
            return HorizontalSectionController()
        }
        return ActivitySectionController()
    }
    
    func emptyView(for listAdapter: IGListAdapter) -> UIView? {
        return nil
    }
}

