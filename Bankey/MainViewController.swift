//
//  MainViewController.swift
//  Bankey
//
//  Created by Vong Nyuksoon on 04/01/2023.
//

import Foundation
import UIKit

class MainViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTabBar()
    }
}

extension MainViewController {
    private func setupViews() {
        let summaryViewController = AccountSummaryViewController()
        let moveMoneyViewController = MoveMoneyViewController()
        let moreViewController = MoreViewController()
        
        summaryViewController.setTabBarImage(name: "Summary", image: "list.dash.header.rectangle")
        moveMoneyViewController.setTabBarImage(name: "Move Money", image: "arrow.left.arrow.right")
        moreViewController.setTabBarImage(name: "More", image: "ellipsis")
        
        let summaryNC = UINavigationController(rootViewController: summaryViewController)
        let moveMoneyNC = UINavigationController(rootViewController: moveMoneyViewController)
        let moreViewNC = UINavigationController(rootViewController: moreViewController)
        
        hideNavigationBarLine(summaryNC.navigationBar)
        viewControllers = [summaryNC, moveMoneyNC, moreViewNC]
    }
    
    private func hideNavigationBarLine(_ navigationBar: UINavigationBar)
    {
        let img = UIImage()
        navigationBar.shadowImage = img
        navigationBar.setBackgroundImage(img, for: .default)
        navigationBar.isTranslucent = false
    }
    
    private func setupTabBar() {
        tabBar.tintColor = .systemTeal
        tabBar.isTranslucent = false
    }
}

class AccountSummaryViewController: UIViewController {
    override func viewDidLoad() {
        title = "Summary"
    }
}

class MoveMoneyViewController: UIViewController {
    override func viewDidLoad() {
        title = "Move money"
    }
}

class MoreViewController: UIViewController {
    override func viewDidLoad() {
        title = "More"
    }
}
