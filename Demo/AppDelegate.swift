//
//  AppDelegate.swift
//  Demo
//
//  Created by Nguyen Hoang on 11/4/19.
//  Copyright © 2019 VFA. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        GMSServices.provideAPIKey("AIzaSyBWpuIkLBR7hd0ctSisOynEOwdYGwuc35s")
        GMSPlacesClient.provideAPIKey("AIzaSyBWpuIkLBR7hd0ctSisOynEOwdYGwuc35s")
        
        return true
    }
}

