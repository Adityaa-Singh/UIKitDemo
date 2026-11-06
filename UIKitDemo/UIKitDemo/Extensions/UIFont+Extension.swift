//
//  UIFont+Extension.swift
//  Aditya Tes
//
//  Created by Kamal Saini on 05/11/26.
//

import Foundation
import UIKit

extension UIFont {

    static func appFont(
        size: CGFloat,
        weight: UIFont.Weight = .regular
    ) -> UIFont {

        return UIFont.systemFont(
            ofSize: size,
            weight: weight
        )
    }

    static func customFont(
        name: String,
        size: CGFloat
    ) -> UIFont {

        return UIFont(name: name, size: size)
            ?? UIFont.systemFont(ofSize: size)
    }

    static var appRegular: UIFont {
        return customFont(name: "Poppins-Regular", size: 16)
    }

    static var appMedium: UIFont {
        return customFont(name: "Poppins-Medium", size: 16)
    }

    static var appSemiBold: UIFont {
        return customFont(name: "Poppins-SemiBold", size: 16)
    }

    static var appBold: UIFont {
        return customFont(name: "Poppins-Bold", size: 16)
    }
}
