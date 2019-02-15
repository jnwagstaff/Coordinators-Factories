//
//  AppCoordinator.swift
//  Architecture
//
//  Created by Jacob Wagstaff on 2/14/19.
//  Copyright © 2019 Jacob Wagstaff. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: NSObject {
    
    /// Shared instance of AppCoordinator.
    static let shared = AppCoordinator()
    
    // MARK: - Properties
    
    var application: UIApplication!
    
    // MARK: - Private Init
    
    private override init() {
        super.init()
    }
    
    // MARK: - Application Events
    
    func application(_ application: UIApplication, didLaunchWith launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.application = application
        // Setups all dependencies for the app
        let container = DependencyContainer()
        
        // 1. Sets root view controller
        container.getViewManager().start()
        
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        //        remoteNotificationManager.updateDeviceToken(using: deviceToken)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        //        remoteNotificationManager.handleRemoteNotification(with: userInfo, fetchCompletionHandler: completionHandler)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        //        remoteNotificationManager.handleRemoteNotification(with: userInfo)
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        //        remoteNotificationManager.handleFailureToRegisterForRemoteNotifications(with: error)
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        //        return urlRouter.route(url: url, options: options)
        return true
    }
}
