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
        let statusBarSize = UIApplication.shared.statusBarFrame.size
        let frame = CGRect(origin: .zero, size: statusBarSize)
        let statusBarView = UIView(frame: frame)
        
        statusBarView.backgroundColor = .systemTeal
        view.addSubview(statusBarView)
    }
    
    func setTabBarImage(name: String, image: String) {
        tabBarItem = UITabBarItem(
            title: name,
            image: UIImage(systemName: image),
            tag: 0
        )
    }
}
