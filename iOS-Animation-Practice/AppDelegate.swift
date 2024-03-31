//
//  AppDelegate.swift
//  iOS-Animation-Practice
//
//  Created by Howard-Zjun on 2024/03/31.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let navi = UINavigationController(rootViewController: ViewController())
        navi.navigationBar.isHidden = true
        window.rootViewController = navi
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}

