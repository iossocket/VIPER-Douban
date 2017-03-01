//
//  SearchHeaderView.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 3/1/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import UIKit

class SearchHeaderView: UIView {
    @IBOutlet weak var searchBar: UIView!
    
    static func loadViewFromNib() -> SearchHeaderView {
        let view = Bundle.main.loadNibNamed("SearchHeaderView", owner: nil, options: nil)?.first as! SearchHeaderView
        view.translatesAutoresizingMaskIntoConstraints = false
        view.searchBar.layer.cornerRadius = view.searchBar.bounds.height / 2
        return view
    }
}
