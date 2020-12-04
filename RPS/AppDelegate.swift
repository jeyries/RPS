//
//  AppDelegate.swift
//  RPS
//
//  Created by Matthew Hanlon on 04/12/2020.
//  Copyright © 2020 Matthew Hanlon. All rights reserved.
//

import UIKit
import SwiftUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func applicationDidFinishLaunching(_ application: UIApplication) {

        self.window = UIWindow()
        
        let rootView = RootView()
        window!.rootViewController = UIHostingController(rootView: rootView)
        window!.makeKeyAndVisible()
    }


}

