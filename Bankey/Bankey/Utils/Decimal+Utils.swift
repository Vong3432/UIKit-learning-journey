//
//  Decimal+Utils.swift
//  Bankey
//
//  Created by Vong Nyuksoon on 09/01/2023.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
