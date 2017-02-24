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
        return true
    }
}

let container = Container() { c in
    c.register(SuggestionPresenterProtocol.self) { _ in SuggestionPresenter() }
    c.register(InTheatreMovieInteractorProtocol.self) { _ in InTheatreMovieInteractor() }
    c.register(ComingSoonMovieInteractorProtocol.self) { _ in ComingSoonMovieInteractor() }
    c.register(Client.self) { _ in AlamofireClient()}
    c.register(HorizontalSectionPresenterProtocol.self) { _ in HorizontalSectionPresenter(currentType: .inTheatre)}
}
