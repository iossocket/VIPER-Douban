//
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import UIKit
import RxSwift

class SuggestionViewController: UIViewController {

    var presenter = container.resolve(SuggestionPresenterProtocol.self)
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter?.fetchMovies().subscribe(onNext: {
            print($0.inTheatre)
            print("======================>")
            print($0.comingSoon)
        }).addDisposableTo(disposeBag)
    }
}

