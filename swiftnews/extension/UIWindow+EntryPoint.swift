//
//  UIWindow+EntryPoint.swift
//  swiftnews
//
//  Created by Gourave Verma on 2020-07-08.
//  Copyright © 2020 Gourave Verma. All rights reserved.
//

import UIKit

extension UIWindow {
    
    func setRoot(viewController: UIViewController) {
        let navigationController = UINavigationController(rootViewController: viewController)
        
        navigationController.navigationBar.prefersLargeTitles = true
        
        self.rootViewController = navigationController
        self.makeKeyAndVisible()
        self.backgroundColor = UIColor.white
    }
    
}
