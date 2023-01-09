//
//  UITextField+Utils.swift
//  Bankey
//
//  Created by Vong Nyuksoon on 09/01/2023.
//

import Foundation
import UIKit

let passwordToggleButton = UIButton(type: .custom)

extension UITextField {
    func enablePasswordToggle() {
        passwordToggleButton.setImage(UIImage(systemName: "eye"), for: .normal)
        passwordToggleButton.setImage(UIImage(systemName: "eye.fill"), for: .selected)
        passwordToggleButton.addTarget(self, action: #selector(togglePasswordView), for: .primaryActionTriggered)
        
        rightView = passwordToggleButton
        rightViewMode = .always
    }
    
    @objc func togglePasswordView(_ sender: UIButton) {
        isSecureTextEntry.toggle()
        passwordToggleButton.isSelected.toggle()
    }
}
