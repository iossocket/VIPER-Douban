//
//  SuggestionPresenterProtocol.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 2/15/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import Foundation
import RxSwift

protocol SuggestionPresenterProtocol {
    func fetchMovies() -> Observable<(InTheatreAndComingSoonMovies, Top250Movies)>
}
