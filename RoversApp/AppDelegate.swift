//
//  AppDelegate.swift
//  RoversApp
//
//  Created by Tutku on 27.07.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let tabBarController = UITabBarController()
        let curiosityViewController = CuriosityRouter().prepareView()
        let spiritViewController = SpiritRouter().prepareView()
        let opportunityViewController = OpportunityRouter().prepareView()
        let controllers = [curiosityViewController,spiritViewController,opportunityViewController]
        tabBarController.setViewControllers(controllers, animated: true)
        if let items = tabBarController.tabBar.items {
            let images = ["Curiosity", "Spirit", "Opportunity"]
            for x in 0..<items.count {
                items[x].image = UIImage(named: images[x])
            }
        }

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = tabBarController

        
        return true
    }
}
