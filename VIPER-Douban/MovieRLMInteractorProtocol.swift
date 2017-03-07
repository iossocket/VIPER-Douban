//
//  MovieRLMInteractorProtocol.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 3/7/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import Foundation

protocol MovieRLMInteractorProtocol {
    func saveMoviesToRealm(movies: Array<Movie>) -> Array<Movie>
}
