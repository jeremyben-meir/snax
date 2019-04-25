//
//  TabBarController.swift
//  snax
//
//  Created by Jessica Yuan on 4/20/19.
//  Copyright © 2019 Jessica Yuan. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let cartViewController = CartViewController()
        cartViewController.tabBarItem = UITabBarItem.init(title: "My Cart", image: UIImage(named: "cart"), tag: 0)
        let accountViewController = AccountViewController()
        accountViewController.tabBarItem = UITabBarItem.init(title: "Account", image: UIImage(named: "acct"), tag: 1)
        let restaurantViewController = ViewController()
        restaurantViewController.tabBarItem = UITabBarItem.init(title: "Restaurants", image: UIImage(named: "rest"), tag: 2)
        
        UITabBar.appearance().tintColor = UIColor(red: 31/255.0, green: 207/255.0, blue: 131/255.0, alpha: 1.0)
        
        
        let viewControllerList = [accountViewController, restaurantViewController, cartViewController]
        //viewControllers = viewControllerList
        viewControllers = viewControllerList.map{ UINavigationController(rootViewController: $0) }
        UINavigationBar.appearance().prefersLargeTitles = true
        UINavigationBar.appearance().tintColor = UIColor(red: 31/255.0, green: 207/255.0, blue: 131/255.0, alpha: 1.0)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
