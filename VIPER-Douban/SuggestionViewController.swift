//
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import UIKit
import RxSwift

class SuggestionViewController: UIViewController {

    var presenter: SuggestionPresenterProtocol?
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = SuggestionPresenter()
        self.presenter?.fetchMovies().subscribe(onNext: {
            print($0)
        }).addDisposableTo(disposeBag)
    }
}

