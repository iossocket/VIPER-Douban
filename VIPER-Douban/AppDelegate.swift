//
//  AppDelegate.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 2/15/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import UIKit
import Swinject

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let tabbar = window?.rootViewController as! UITabBarController
        tabbar.tabBar.tintColor = UIColor(red: 246.0 / 255, green: 166.0 / 255, blue: 35.0 / 255, alpha: 1)
        return true
    }
}

let container = Container() { c in
    c.register(SuggestionPresenterProtocol.self) { _ in SuggestionPresenter() }
    c.register(InTheatreMovieInteractorProtocol.self) { _ in InTheatreMovieInteractor() }
    c.register(ComingSoonMovieInteractorProtocol.self) { _ in ComingSoonMovieInteractor() }
    c.register(Top250InteractorProtocol.self) { _ in Top250Interactor() }
    c.register(Client.self) { _ in AlamofireClient()}
    c.register(HorizontalSectionPresenterProtocol.self) { _ in HorizontalSectionPresenter(currentType: .inTheatre) }
    c.register(MovieRLMInteractorProtocol.self) { _ in MovieRLMInteractor() }
    c.register(MovieDetailPresenterProtocol.self) { _ in MovieDetailPresenter() }
    c.register(MovieDetailInfoPresenterProtocol.self) { _ in MovieDetailInfoPresenter() }
}
