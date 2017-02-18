//
//  SuggestionInteractor.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 2/15/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import RxSwift
import RxAlamofire

enum MovieError: Error {
    case parseError
}

struct SuggestionInteractor: SuggestionInteractorProtocol {
    
    func fetchMovies(from: Int, count: Int, at city: CityName) -> Observable<Array<Movie>> {
        return AlamofireClient().send(InTheatreMovieRequest(from: from, count: count, at: city)).map { response -> Array<Movie> in
            guard let resp = response else {
                throw MovieError.parseError
            }
            return resp.movies
        }
    }
}
