//
//  TabBarController.swift
//  snax
//
//  Created by Jessica Yuan on 4/20/19.
//  Copyright © 2019 Jessica Yuan. All rights reserved.
//

import UIKit

protocol CreateNewUserDelegate: class{
    func createNewUser(user: User) -> User
}
class TabBarController: UITabBarController {
    
    var email: String
    var firstName: String
    var lastName: String
    
    init(email: String, firstName: String, lastName: String) {
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let cartViewController = CartViewController(email: email)
        cartViewController.tabBarItem = UITabBarItem.init(title: "My Cart", image: UIImage(named: "cart"), tag: 0)
        let accountViewController = AccountViewController(email: email, firstName: firstName, lastName: lastName)
        accountViewController.tabBarItem = UITabBarItem.init(title: "Account", image: UIImage(named: "acct"), tag: 1)
        let restaurantViewController = ViewController(email: email)
        restaurantViewController.tabBarItem = UITabBarItem.init(title: "Restaurants", image: UIImage(named: "rest"), tag: 2)
        let deliveryViewController = DeliveryViewController()
        deliveryViewController.tabBarItem = UITabBarItem.init(title: "Delivery", image: UIImage(named: "deliver"), tag: 3)
        
        UITabBar.appearance().tintColor = UIColor(red: 31/255.0, green: 207/255.0, blue: 131/255.0, alpha: 1.0)
        
        
        let viewControllerList = [accountViewController, restaurantViewController, cartViewController, deliveryViewController]
        //viewControllers = viewControllerList
        viewControllers = viewControllerList.map{ UINavigationController(rootViewController: $0) }
        //UINavigationBar.appearance().prefersLargeTitles = true
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

extension TabBarController: CreateNewUserDelegate {
    func createNewUser(user: User) -> User{
        return user
    }
    
    
}
