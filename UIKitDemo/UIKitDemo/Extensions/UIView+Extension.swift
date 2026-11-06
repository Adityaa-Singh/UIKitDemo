//
//  UIView+Extension.swift
//  Aditya Tes
//
//  Created by Kamal Saini on 02/05/26.
//

import Foundation
import UIKit

extension UIView {

    func setCornerRadius(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }

    func setBorder(
        color: UIColor,
        width: CGFloat = 1
    ) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }

    func setShadow(
        color: UIColor = .black,
        opacity: Float = 0.15,
        radius: CGFloat = 4,
        offset: CGSize = CGSize(width: 0, height: 2)
    ) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
        self.layer.shadowOffset = offset
        self.layer.masksToBounds = false
    }

    func makeCircular() {
        self.layer.cornerRadius = self.bounds.width / 2
        self.clipsToBounds = true
    }

    func setGradientBackground(
        colors: [UIColor],
        startPoint: CGPoint = CGPoint(x: 0, y: 0),
        endPoint: CGPoint = CGPoint(x: 1, y: 1)
    ) {

        let gradient = CAGradientLayer()
        gradient.colors = colors.map { $0.cgColor }
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        gradient.frame = self.bounds

        self.layer.insertSublayer(gradient, at: 0)
    }
}


