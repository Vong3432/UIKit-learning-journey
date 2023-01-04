//
//  OnboardingViewController.swift
//  Bankey
//
//  Created by Vong Nyuksoon on 04/01/2023.
//

import Foundation
import UIKit

class OnboardingViewController: UIViewController {
    
    private let stackView = UIStackView()
    private let imageView = UIImageView()
    private let labelView = UILabel()
    
    let label: String
    let image: String
    
    init(label: String, image: String) {
        self.label = label
        self.image = image
        
        super.init(nibName: nil, bundle: nil)
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        style()
    }
}

extension OnboardingViewController {
    private func style() {
        view.backgroundColor = .systemBackground
        
        // StackView
        stackView.axis = .vertical
        stackView.spacing = 20
        
        // ImageView
        imageView.image = UIImage(named: image)
        imageView.contentMode = .scaleAspectFit
        
        // LabelView
        labelView.font = .preferredFont(forTextStyle: .title3)
        labelView.textAlignment = .center
        labelView.adjustsFontForContentSizeCategory = true
        labelView.numberOfLines = 0
        labelView.text = label
    }
    
    private func layout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        labelView.translatesAutoresizingMaskIntoConstraints = false
                
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(labelView)
        
        view.addSubview(stackView)
        
        // Stack View
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.leadingAnchor, multiplier: 1),
        ])
    }
}
