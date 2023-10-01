//
//  AppRouter.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 02.02.2023.
//

import UIKit

protocol AppRoutable: AnyObject {
    func routeToInitialScene()
}

class AppRouter {
    init() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = .systemBackground
    }
    
    private var window: UIWindow
}

extension AppRouter: AppRoutable {
    func routeToInitialScene() {
        window.rootViewController = InitialSceneRouter.assembly()
        window.makeKeyAndVisible()
    }
}
