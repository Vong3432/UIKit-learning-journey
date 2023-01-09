//
//  ViewController.swift
//  Bankey
//
//  Created by Vong Nyuksoon on 02/01/2023.
//

import UIKit

protocol LogoutDelegate: AnyObject {
    func didLogout()
}

protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}

class LoginViewController: UIViewController {
    
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    weak var delegate: LoginViewControllerDelegate?
    
    var username: String? {
        loginView.usernameTextField.text
    }
    
    var password: String? {
        loginView.passwordTextField.text
    }
    
    let leadingEdgeOnScreen: CGFloat = 16.0
    let leadingEdgeOffScreen: CGFloat = -1000
    var titleLeadingConstraint: NSLayoutConstraint?
    var subtitleLeadingConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        signInButton.configuration?.showsActivityIndicator = false
    }

}

extension LoginViewController {
    private func animate() {
        let duration = 1.5
        
        let titleConstraintAnimator = UIViewPropertyAnimator(duration: duration, curve: .easeInOut) {
            self.titleLeadingConstraint?.constant = self.leadingEdgeOnScreen
            self.view.layoutIfNeeded()
        }
        titleConstraintAnimator.startAnimation()
        
        let subtitleConstraintAnimator = UIViewPropertyAnimator(duration: duration * 2, curve: .easeInOut) {
            self.subtitleLeadingConstraint?.constant = self.leadingEdgeOnScreen
            self.view.layoutIfNeeded()
        }
        subtitleConstraintAnimator.startAnimation()
        
        let titleAlphaAnimator = UIViewPropertyAnimator(duration: duration, curve: .linear) {
            self.titleLabel.alpha = 1
        }
        titleAlphaAnimator.startAnimation(afterDelay: 1)
        
        let subtitleAlphaAnimator = UIViewPropertyAnimator(duration: duration, curve: .linear) {
            self.subtitleLabel.alpha = 1
        }
        subtitleAlphaAnimator.startAnimation(afterDelay: 1)
    }
}

extension LoginViewController {
    private func style() {
        titleLabel.text = "Bankey"
        titleLabel.textAlignment = .center
        titleLabel.font = .preferredFont(forTextStyle: .largeTitle)
        titleLabel.alpha = 0
        
        subtitleLabel.text = "Lorem ipsum is placeholder text commonly used in the graphic, print."
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 0
        subtitleLabel.font = .preferredFont(forTextStyle: .title2)
        subtitleLabel.alpha = 0
        
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.text = "Something went wrong"
        errorMessageLabel.numberOfLines = 1
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.isHidden = true
    }
    
    private func layout() {
        view.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        // Title label
        NSLayoutConstraint.activate([
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.trailingAnchor, multiplier: 1),
            titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor)
        ])
        titleLeadingConstraint = titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingEdgeOffScreen)
        titleLeadingConstraint?.isActive = true
        
        // Subtitle label
        NSLayoutConstraint.activate([
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: subtitleLabel.trailingAnchor, multiplier: 1),
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: subtitleLabel.bottomAnchor, multiplier: 5)
        ])
        subtitleLeadingConstraint = subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingEdgeOffScreen)
        subtitleLeadingConstraint?.isActive = true
        
        // LoginView
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
        ])
        
        // SignInBtn
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
        
        // Error message label
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 3),
            errorMessageLabel.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor),
        ])
    }
}

// MARK: - Actions
extension LoginViewController {
    @objc func signInTapped(_ sender: UIButton) {
        login()
    }
    
    private func login() {
        
        guard let username = username, let password = password else {
            assertionFailure("Username / password should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureErrorMessage(message: "Username & password cannot be empty.")
            return
        }
        
        signInButton.configuration?.showsActivityIndicator = true
        delegate?.didLogin()
    }
    
    private func configureErrorMessage(message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
