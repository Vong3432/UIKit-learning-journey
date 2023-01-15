//
//  AppDelegate.swift
//  Bankey
//
//  Created by Vong Nyuksoon on 02/01/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    let onboardingViewController = OnboardingContainerViewController()
    let loginViewController = LoginViewController()
    let mainViewController = MainViewController() 
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        let hasOnboarded = LocalState.hasOnboarded
        
        loginViewController.delegate = self
        onboardingViewController.delegate = self
        registerForNotifications()
        
        if hasOnboarded {
            mainViewController.setStatusBar()
            window?.rootViewController = loginViewController
//            window?.rootViewController = mainViewController
        } else {
            window?.rootViewController = onboardingViewController
        }
        
        window?.rootViewController = mainViewController
        
        return true
    }
}

extension AppDelegate {
    private func registerForNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didLogout),
            name: .logout,
            object: nil
        )
    }
}

extension AppDelegate: LogoutDelegate {
    @objc func didLogout() {
        debugPrint("✅ - Did logout")
        setRootViewController(loginViewController)
    }
}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        debugPrint("✅ - Did login")
        setRootViewController(mainViewController)
    }
}

extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        debugPrint("✅ - Did finish onboarding")
        LocalState.hasOnboarded = true
        setRootViewController(loginViewController)
    }
}

extension AppDelegate {
    func setRootViewController(_ controller: UIViewController, animated: Bool? = true) {
        guard let window = window else { return }
        window.makeKeyAndVisible()
        window.rootViewController = controller
        
        UIView.transition(
            with: window,
            duration: 0.3,
            options: .transitionCrossDissolve,
            animations: nil
        )
    }
}
