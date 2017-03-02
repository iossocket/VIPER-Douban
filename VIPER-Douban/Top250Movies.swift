//
//  Top250Movies.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 3/2/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import IGListKit

class Top250Movies: NSObject, IGListDiffable {
    let movies: Array<DisplayMovie>
    
    init(movies: Array<DisplayMovie>) {
        self.movies = movies
        super.init()
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    func isEqual(toDiffableObject object: IGListDiffable?) -> Bool {
        guard let other = object as? Top250Movies else {
            return false
        }
        let selfId = self.movies.reduce("") { (str, movie) -> String in
            str + movie.id
        }
        let otherId = other.movies.reduce("") { (str, movie) -> String in
            str + movie.id
        }
        return selfId == otherId
    }
}
