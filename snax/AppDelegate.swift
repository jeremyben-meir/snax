//
//  AppDelegate.swift
//  snax
//
//  Created by Jessica Yuan on 4/20/19.
//  Copyright © 2019 Jessica Yuan. All rights reserved.
//

import UIKit
import GoogleSignIn
import SnapKit
import GoogleMaps
import GooglePlaces

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

    var window: UIWindow?
    var user = [User]()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
    
        GIDSignIn.sharedInstance()?.clientID = "325016939907-j3fnfhbt3abraoa87n293pvc6fh8atog.apps.googleusercontent.com"
        GIDSignIn.sharedInstance()?.delegate = self
        
        
        GMSServices.provideAPIKey("AIzaSyANVgwUJFNUpIszq7kiDqy9OzjopxFICNE")
        GMSPlacesClient.provideAPIKey("AIzaSyANVgwUJFNUpIszq7kiDqy9OzjopxFICNE")
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIStoryboard(name: "LaunchScreen", bundle:nil).instantiateInitialViewController() ?? UIViewController()
        //window?.rootViewController = TabBarController()
        window?.makeKeyAndVisible()
        
        if GIDSignIn.sharedInstance().hasAuthInKeychain(){
            DispatchQueue.main.async {
                GIDSignIn.sharedInstance()?.signInSilently()
            }
        } else {
            window?.rootViewController = SignInViewController()
        }
        return true
    }
    
        func getUsername(email: String) -> String {
            let components = email.components(separatedBy: "@")
            return components[0]
        }
   
        func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
            if let error = error {
                print(error.localizedDescription)
                return
            
            }
            window?.rootViewController = TabBarController()
        }
    
        func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
            if let error = error {
                print(error.localizedDescription)
                return
            }
        }
    
        func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
            return GIDSignIn.sharedInstance().handle(url, sourceApplication:options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String, annotation: [:])
        }


//ORIGINAL CODE
//
//    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
//        return GIDSignIn.sharedInstance().handle(url as URL?,
//                                                 sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
//                                                 annotation: options[UIApplication.OpenURLOptionsKey.annotation])
//    }
//
//    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
//              withError error: Error!) {
//        if let error = error {
//            print("\(error.localizedDescription)")
//        } else {
//            window?.rootViewController = TabBarController()
//
//            let idToken = user.authentication.idToken
//            //NetworkManager.loginGet(idToken: idToken!, completion: { user in
//                //print(user)
//            //})
//            let userId = user.userID
//            let fullName = user.profile.name
//            let givenName = user.profile.givenName
//            let familyName = user.profile.familyName
//            let email = user.profile.email
//
//            NetworkManager.loginPost(userID: userId!, idToken: idToken!, name: fullName!, givenName: givenName!, familyName: familyName!, email: email!) { user in
//                print(user)
//            }
//
//        }
//    }
//
//
//
//
//
//    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
//              withError error: Error!) {
//        print("signed out")
//    }
//
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

