//
//  DisplayMovie.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 2/21/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import IGListKit

class DisplayMovie: NSObject, IGListDiffable {
    var id: String
    var imageUrl: String
    init(id: String, imageUrl: String) {
        self.id = id
        self.imageUrl = imageUrl
        super.init()
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    func isEqual(toDiffableObject object: IGListDiffable?) -> Bool {
        guard let other = object as? DisplayMovie else {
            return false
        }
        return self.id == other.id
    }
}
