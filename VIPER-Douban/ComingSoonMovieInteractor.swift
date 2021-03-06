//
//  ComingSoonMovieInteractor.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 2/19/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import RxSwift

struct ComingSoonMovieInteractor: ComingSoonMovieInteractorProtocol {
    let client = container.resolve(Client.self)
    
    func fetchMovies(from: Int, count: Int, at city: CityName) -> Observable<Array<Movie>> {
        return client!.send(ComingSoonMovieRequest(from: from, count: count, at: city)).map { response -> Array<Movie> in
            guard let resp = response else {
                throw MovieError.parseError
            }
            return resp.movies
        }
    }
}
