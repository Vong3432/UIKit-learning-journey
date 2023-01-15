//
//  ShakyBellView.swift
//  Bankey
//
//  Created by Vong Nyuksoon on 12/01/2023.
//

import Foundation
import UIKit

class ShakeyBellView: UIView {
    let shakyBellImageView = UIImageView()
    let badgeLabel = UILabel()
    
    private let badgeSize = 16.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 48, height: 48)
    }
}

extension ShakeyBellView {
    func setup() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(shakyBellImageViewTapped))
        shakyBellImageView.addGestureRecognizer(gestureRecognizer)
        shakyBellImageView.isUserInteractionEnabled = true
    }
    
    func style() {
        shakyBellImageView.image = UIImage(systemName: "bell.fill")
        shakyBellImageView.tintColor = .white
        shakyBellImageView.contentMode = .scaleAspectFit
        
        badgeLabel.font = .systemFont(ofSize: 13.0)
        badgeLabel.text = "5"
        badgeLabel.textAlignment = .center
        badgeLabel.backgroundColor = .systemRed
        badgeLabel.tintColor = .white
        badgeLabel.layer.cornerRadius = badgeSize / 2
        badgeLabel.layer.masksToBounds = true
    }
    
    func layout() {
        translatesAutoresizingMaskIntoConstraints = false
        shakyBellImageView.translatesAutoresizingMaskIntoConstraints = false
        badgeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(shakyBellImageView)
        addSubview(badgeLabel)
        
        // Shaky Bell
        NSLayoutConstraint.activate([
            shakyBellImageView.widthAnchor.constraint(equalToConstant: 24),
            shakyBellImageView.heightAnchor.constraint(equalToConstant: 24),
            shakyBellImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            shakyBellImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        
        // Badge
        NSLayoutConstraint.activate([
            badgeLabel.topAnchor.constraint(equalTo: shakyBellImageView.topAnchor),
            badgeLabel.leadingAnchor.constraint(equalTo: shakyBellImageView.trailingAnchor, constant: -9),
            badgeLabel.widthAnchor.constraint(equalToConstant: badgeSize),
            badgeLabel.heightAnchor.constraint(equalToConstant: badgeSize),
        ])
    }
}

extension ShakeyBellView {
    @objc private func shakyBellImageViewTapped(_ recognizer: UIGestureRecognizer) {
        shakeAnimation()
    }
    
    private func shakeAnimation() {
        let numOfFrames: Double = 6 // shake bells left right total of 6 times
        let frameDuration: Double = 1 / numOfFrames // make it between 0 - 1
        let shakeAngleInRad = 22 * Double.pi / 180
        
        shakyBellImageView.setAnchorPoint(.init(x: 0.5, y: 0))
        
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: .calculationModeCubic) {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: frameDuration) { [self] in
                shakyBellImageView.transform = CGAffineTransform(rotationAngle: -shakeAngleInRad)
            }

            UIView.addKeyframe(withRelativeStartTime: frameDuration * 1, relativeDuration: frameDuration) { [self] in
                shakyBellImageView.transform = CGAffineTransform(rotationAngle: shakeAngleInRad)
            }

            UIView.addKeyframe(withRelativeStartTime: frameDuration * 2, relativeDuration: frameDuration) { [self] in
                shakyBellImageView.transform = CGAffineTransform(rotationAngle: -shakeAngleInRad)
            }

            UIView.addKeyframe(withRelativeStartTime: frameDuration * 3, relativeDuration: frameDuration) { [self] in
                shakyBellImageView.transform = CGAffineTransform(rotationAngle: shakeAngleInRad)
            }
            UIView.addKeyframe(withRelativeStartTime: frameDuration * 4, relativeDuration: frameDuration) { [self] in
                shakyBellImageView.transform = CGAffineTransform(rotationAngle: -shakeAngleInRad)
            }
            UIView.addKeyframe(withRelativeStartTime: frameDuration * 5, relativeDuration: frameDuration) { [self] in
                #warning("Bell not in correct position after rotating device...")
                shakyBellImageView.transform = CGAffineTransform.identity
            }
        }
    }
}
