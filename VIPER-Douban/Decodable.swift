//
//  Decodable.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 2/19/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import Foundation

protocol Decodable {
    static func parse(data: Any) -> Self?
}
