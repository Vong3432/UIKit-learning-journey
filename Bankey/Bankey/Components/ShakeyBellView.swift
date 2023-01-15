//
//  ShakyBellView.swift
//  Bankey
//
//  Created by Vong Nyuksoon on 12/01/2023.
//

import Foundation
import UIKit

class ShakeyBellView: UIView {
    let shakeyBellImageView = UIImageView()
    
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
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(shakeyBellImageViewTapped))
        shakeyBellImageView.addGestureRecognizer(gestureRecognizer)
        shakeyBellImageView.isUserInteractionEnabled = true
    }
    
    func style() {
        shakeyBellImageView.image = UIImage(systemName: "bell.fill")
        shakeyBellImageView.tintColor = .white
        shakeyBellImageView.contentMode = .scaleAspectFit
    }
    
    func layout() {
        translatesAutoresizingMaskIntoConstraints = false
        shakeyBellImageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(shakeyBellImageView)
        
        NSLayoutConstraint.activate([
            shakeyBellImageView.widthAnchor.constraint(equalToConstant: 24),
            shakeyBellImageView.heightAnchor.constraint(equalToConstant: 24),
            shakeyBellImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            shakeyBellImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}

extension ShakeyBellView {
    @objc private func shakeyBellImageViewTapped(_ recognizer: UIGestureRecognizer) {
        shakeAnimation()
    }
    
    private func shakeAnimation() {
        let numOfFrames: Double = 6 // shake bells left right total of 6 times
        let frameDuration: Double = 1 / numOfFrames // make it between 0 - 1
        let shakeAngleInRad = 22 * Double.pi / 180
        
        shakeyBellImageView.setAnchorPoint(.init(x: 0.5, y: 0))

        UIView.animateKeyframes(withDuration: 1, delay: 0, options: .calculationModeCubic) {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25) { [self] in
                shakeyBellImageView.transform = CGAffineTransform(rotationAngle: -shakeAngleInRad)
            }

            UIView.addKeyframe(withRelativeStartTime: frameDuration * 1, relativeDuration: 0.25) { [self] in
                shakeyBellImageView.transform = CGAffineTransform(rotationAngle: shakeAngleInRad)
            }

            UIView.addKeyframe(withRelativeStartTime: frameDuration * 2, relativeDuration: 0.25) { [self] in
                shakeyBellImageView.transform = CGAffineTransform(rotationAngle: -shakeAngleInRad)
            }

            UIView.addKeyframe(withRelativeStartTime: frameDuration * 3, relativeDuration: 0.25) { [self] in
                shakeyBellImageView.transform = CGAffineTransform(rotationAngle: shakeAngleInRad)
            }
            UIView.addKeyframe(withRelativeStartTime: frameDuration * 4, relativeDuration: 0.25) { [self] in
                shakeyBellImageView.transform = CGAffineTransform(rotationAngle: -shakeAngleInRad)
            }
            UIView.addKeyframe(withRelativeStartTime: frameDuration * 5, relativeDuration: 0.25) { [self] in
                shakeyBellImageView.transform = .identity
            }
        }
    }
}
