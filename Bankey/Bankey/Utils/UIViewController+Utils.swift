//
//  UIViewController+Utils.swift
//  Bankey
//
//  Created by Vong Nyuksoon on 04/01/2023.
//

import Foundation
import UIKit

extension UIViewController {
    func setStatusBar() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithTransparentBackground() // to hide Navigation Bar Line also
        navBarAppearance.backgroundColor = .systemTeal
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
    }
    
    func setTabBarImage(name: String, image: String) {
        tabBarItem = UITabBarItem(
            title: name,
            image: UIImage(systemName: image),
            tag: 0
        )
    }
}
