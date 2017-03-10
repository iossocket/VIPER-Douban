//
//  MovieRLM.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 3/7/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import RealmSwift

enum MovieTypeEnum: String {
    case InTheatre = "InTheatre"
    case ComingSoon = "ComingSoon"
    case Top250 = "Top250"
}

class RealmString: Object {
    dynamic var stringValue: String = ""
    convenience init(string: String) {
        self.init()
        self.stringValue = string
    }
}

class MovieRLM: Object {
    dynamic var id: String = ""
    dynamic var year: String = ""
    dynamic var title: String = ""
    dynamic var originalTitle: String = ""
    dynamic var collectCount: Int = 0
    dynamic var imageSmall: String = ""
    dynamic var imageMedium: String = ""
    dynamic var imageLarge: String = ""
    dynamic var type: String = ""
    
    dynamic var rating: RatingRLM?
    
    let genres = List<RealmString>()
    let casts = List<CastRLM>()
    let directors = List<DirectorRLM>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(movie: Movie, type: MovieTypeEnum) {
        self.init()
        self.id = movie.id
        self.year = movie.year
        self.title = movie.title
        self.originalTitle = movie.originalTitle
        self.collectCount = movie.collectCount
        self.imageSmall = movie.images.small
        self.imageMedium = movie.images.medium
        self.imageLarge = movie.images.large
        
        self.rating = RatingRLM(rating: movie.rating)
        movie.genres.forEach { item in
            self.genres.append(RealmString(string: item))
        }
        movie.casts.forEach { item in
            self.casts.append(CastRLM(cast: item))
        }
        movie.directors.forEach { item in
            self.directors.append(DirectorRLM(director: item))
        }
        
        self.type = type.rawValue
    }
}

class RatingRLM: Object {
    dynamic var max: Int = 0
    dynamic var min: Int = 0
    dynamic var average: Float = 0
    dynamic var stars: String = ""
    
    convenience init(rating: Rating) {
        self.init()
        self.max = rating.max
        self.min = rating.min
        self.average = rating.average
        self.stars = rating.stars
    }
}

class CastRLM: Object {
    dynamic var id: String = ""
    dynamic var name: String = ""
    dynamic var avatarSmall: String = ""
    dynamic var avatarMedium: String = ""
    dynamic var avatarLarge: String = ""
    
    convenience init(cast: Cast) {
        self.init()
        self.id = cast.id
        self.name = cast.name
        self.avatarSmall = cast.avatars.small
        self.avatarMedium = cast.avatars.medium
        self.avatarLarge = cast.avatars.large
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class DirectorRLM: Object  {
    dynamic var id: String = ""
    dynamic var name: String = ""
    dynamic var avatarSmall: String = ""
    dynamic var avatarMedium: String = ""
    dynamic var avatarLarge: String = ""
    
    convenience init(director: Director) {
        self.init()
        self.id = director.id
        self.name = director.name
        self.avatarSmall = director.avatars.small
        self.avatarMedium = director.avatars.medium
        self.avatarLarge = director.avatars.large
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
