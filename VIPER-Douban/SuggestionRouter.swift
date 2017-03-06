//
//  SuggestionRouter.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 3/6/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import UIKit

struct SuggestionRouter {
    func showDetailViewController(from viewController: UIViewController?, by imageViewUrl: String?) {
        guard let vc = viewController, let url = imageViewUrl else {
            return
        }
        guard let detail = UIStoryboard(name: "Detail", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController else {
            return
        }
        
        detail.movieImageUrl = url
        vc.show(detail, sender: nil)
    }
}
