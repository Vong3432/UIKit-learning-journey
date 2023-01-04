//
//  DummyViewController.swift
//  Bankey
//
//  Created by Vong Nyuksoon on 04/01/2023.
//

import Foundation
import UIKit

class DummyViewController: UIViewController {
    let stackView = UIStackView()
    let label = UILabel()
    let logoutButton = UIButton(type: .system)
    
    weak var delegate: LogoutDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension DummyViewController {
    private func style() {
        stackView.axis = .vertical
        stackView.spacing = 20
        
        label.text = "Welcome screen"
        
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.addTarget(self, action: #selector(onLogoutButtonTapped), for: .primaryActionTriggered)
    }
    
    private func layout() {
        view.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(logoutButton)
        
        view.addSubview(stackView)
        
        // Stack View
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        ])
    }
}

// MARK: - Actions
extension DummyViewController {
    @objc private func onLogoutButtonTapped(_ sender: UIButton) {
        delegate?.didLogout()
    }
}
