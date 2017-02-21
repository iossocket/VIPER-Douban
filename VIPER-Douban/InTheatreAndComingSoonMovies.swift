//
//  InTheatreAndComingSoonMovies.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 2/21/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import IGListKit

class InTheatreAndComingSoonMovies: NSObject, IGListDiffable {
    let inTheatre: Array<DisplayMovie>
    let comingSoon: Array<DisplayMovie>
    
    init(inTheatre: Array<DisplayMovie>, comingSoon: Array<DisplayMovie>) {
        self.inTheatre = inTheatre
        self.comingSoon = comingSoon
        super.init()
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    func isEqual(toDiffableObject object: IGListDiffable?) -> Bool {
        guard let other = object as? InTheatreAndComingSoonMovies else {
            return false
        }
        let selfId = self.inTheatre.reduce("") { (str, movie) -> String in
            str + movie.id
        }
        let otherId = other.inTheatre.reduce("") { (str, movie) -> String in
            str + movie.id
        }
        return selfId == otherId
    }
}
