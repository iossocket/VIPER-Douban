//
//  SuggestionRouter.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 3/6/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import UIKit

struct SuggestionRouter {
    func showDetailViewController(from viewController: UIViewController?, by imageViewUrl: String?, id: String?) {
        guard let vc = viewController, let url = imageViewUrl, let id = id else {
            return
        }
        let detail = MovieDetailViewController(imageUrl: url, id: id)
        vc.show(detail, sender: nil)
    }
}
