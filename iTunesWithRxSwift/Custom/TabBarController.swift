//
//  TabBarController.swift
//  iTunesWithRxSwift
//
//  Created by 양승혜 on 8/9/24.
//

import UIKit

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let today = UINavigationController(rootViewController: DummyViewController())
        today.tabBarItem = UITabBarItem(title: Strings.TabBarTitle.today, image: UIImage(systemName: "book"), tag: 0)
        
        let game = UINavigationController(rootViewController: DummyViewController())
        game.tabBarItem = UITabBarItem(title: Strings.TabBarTitle.game, image: UIImage(systemName: "gamecontroller"), tag: 1)
        
        let app = UINavigationController(rootViewController: DummyViewController())
        app.tabBarItem = UITabBarItem(title: Strings.TabBarTitle.app, image: UIImage(systemName: "square.stack.fill"), tag: 2)
        
        let arcade = UINavigationController(rootViewController: DummyViewController())
        arcade.tabBarItem = UITabBarItem(title: Strings.TabBarTitle.arcade, image: UIImage(systemName: "star"), tag: 3)
        
        let search = UINavigationController(rootViewController: StartSearchViewController())
        search.tabBarItem = UITabBarItem(title: Strings.TabBarTitle.search, image: UIImage(systemName: "magnifyingglass"), tag: 4)
        
        setViewControllers([today, game, app, arcade, search], animated: true)
    }
}

