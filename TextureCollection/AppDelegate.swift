//
//  AppDelegate.swift
//  TextureCollection
//
//  Created by Elijah Ponkratenko on 02/05/2018.
//  Copyright © 2018 Eli Ponkratenko. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        var dataModel = [Int]()
        for index in 0..<30  {
            dataModel.append(index)
        }

        ASDisplayNode.shouldShowRangeDebugOverlay = true

        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = .white
        window.rootViewController = ASNavigationController(
            rootViewController: DayScheduleContainer(datas: dataModel)
        )
        window.makeKeyAndVisible()
        self.window = window

        return true
    }

}
