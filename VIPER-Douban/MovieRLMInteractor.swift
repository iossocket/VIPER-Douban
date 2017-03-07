//
//  MovieRLMInteractor.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 3/7/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import RealmSwift

struct MovieRLMInteractor: MovieRLMInteractorProtocol {
    func saveMoviesToRealm(movies: Array<Movie>) -> Array<Movie> {
        let realm = try! Realm()
        let moviesRLM = movies.map { movie -> MovieRLM in
            MovieRLM(movie: movie)
        }
        
        return []
    }
}
