//
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import UIKit

class SuggestionViewController: UIViewController, SuggestionViewProtocol {

    var presenter: SuggestionPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = SuggestionPresenter()
        self.presenter?.interactor = SuggestionInteractor(presenter: self.presenter)
        self.presenter?.view = self
        
        self.presenter?.fetchMovies()
    }
    
    func displayMovies(movies: Array<Movie>) {
        print(movies)
    }
}

