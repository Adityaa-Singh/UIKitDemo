//
//  UIColor+Extension.swift
//  Aditya Tes
//
//  Created by Kamal Saini on 05/11/26.
//

import Foundation
import UIKit

extension UIColor {

    static let appPrimary = UIColor(
        red: 0.10,
        green: 0.35,
        blue: 0.75,
        alpha: 1.0
    )

    static let appSecondary = UIColor(
        red: 0.20,
        green: 0.65,
        blue: 0.85,
        alpha: 1.0
    )

    static let appBackground = UIColor.systemBackground

    static let appText = UIColor.label

    static let appSecondaryText = UIColor.secondaryLabel

    static let appBorder = UIColor.separator

    static let appError = UIColor.systemRed

    static let appSuccess = UIColor.systemGreen
    
    static let appButtonText = UIColor.black

    static let appButtonBackground = UIColor.blue.withAlphaComponent(0.1)

}
