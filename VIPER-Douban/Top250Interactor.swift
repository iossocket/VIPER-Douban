//
//  Top250Interactor.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 3/1/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import RxSwift

struct Top250Interactor: Top250InteractorProtocol {
    let client = container.resolve(Client.self)
    
    func fetchMovies(from: Int, count: Int) -> Observable<Array<Movie>> {
        return client!.send(Top250Request(from: from, count: count)).map({ response -> Array<Movie> in
            guard let resp = response else {
                throw MovieError.parseError
            }
            return resp.movies
        })
    }
}
