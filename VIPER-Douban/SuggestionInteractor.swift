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

struct SuggestionInteractor: SuggestionInteractorProtocol {
    
    var presenter: SuggestionPresenterProtocol?
    
    func fetchMovies(from: Int, count: Int, at city: CityName) {
        let parameters: Parameters = ["city": city.rawValue, "start": from, "count": count]
        Alamofire.request("https://api.douban.com/v2/movie/in_theaters", method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { response in
            guard let movieResponse = Mapper<MovieResponse>().map(JSONObject: response.value) else {
                return
            }
            self.presenter?.fetchedMovies(movies: movieResponse.movies)
        }
    }
}
