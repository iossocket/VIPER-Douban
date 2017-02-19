//
//  InTheaterMovieInteractor.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 2/15/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import RxSwift

enum MovieError: Error {
    case parseError
}

struct InTheatreMovieInteractor: InTheatreMovieInteractorProtocol {
    let client = container.resolve(Client.self)
    
    func fetchMovies(from: Int, count: Int, at city: CityName) -> Observable<Array<Movie>> {
        return client!.send(InTheatreMovieRequest(from: from, count: count, at: city)).map { response -> Array<Movie> in
            guard let resp = response else {
                throw MovieError.parseError
            }
            return resp.movies
        }
    }
}
