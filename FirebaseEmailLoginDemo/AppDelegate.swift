//
//  AppDelegate.swift
//  FirebaseEmailLoginDemo
//
//  Created by Cynthia Strickland on 3/15/17.
//  Copyright © 2017 Fenix Designz. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        FIRApp.configure()

        return true
    }
}

