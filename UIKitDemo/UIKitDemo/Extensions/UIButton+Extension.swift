//
//  UIButton+Extension.swift
//  Aditya Tes
//
//  Created by Kamal Saini on 05/11/26.
//

import Foundation
import UIKit

extension UIButton {

    func configureButton(
        title: String,
        titleColor: UIColor = .white,
        backgroundColor: UIColor = .systemBlue,
        fontName: String? = nil,
        fontSize: CGFloat = 16,
        cornerRadius: CGFloat = 8
    ) {
        
//        self.configuration = nil
//        
//        self.setAttributedTitle(nil, for: .normal)
//        
//        self.setTitle(title, for: .normal)
//        self.setTitleColor(titleColor, for: .normal)
//        self.backgroundColor = backgroundColor
//        
//        if let fontName = fontName,
//           let customFont = UIFont(name: fontName, size: fontSize) {
//            
//            self.titleLabel?.font = customFont
//            
//        } else {
//            
//            self.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
//        }
//        
//        self.layer.cornerRadius = cornerRadius
//        self.clipsToBounds = true
        self.configuration = nil
        self.setAttributedTitle(nil, for: .normal)
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        
        // Device-specific font size
        let deviceFontSize: CGFloat =
        traitCollection.userInterfaceIdiom == .pad
        ? fontSize * 1.15
        : fontSize
        
        // Custom font
        let baseFont: UIFont
        
        if let fontName = fontName {
            baseFont = UIFont(name: fontName, size: deviceFontSize)
            ?? UIFont.systemFont(ofSize: deviceFontSize)
        } else {
            baseFont = UIFont.systemFont(ofSize: deviceFontSize)
        }
        
        // Dynamic Type
        self.titleLabel?.font = UIFontMetrics(
            forTextStyle: .headline
        ).scaledFont(for: baseFont)
        
        self.titleLabel?.adjustsFontForContentSizeCategory = true
        
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }

    func setButtonBorder(
        color: UIColor,
        width: CGFloat = 1
    ) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }

    func setEnabled(_ enabled: Bool) {
        self.isEnabled = enabled
        self.alpha = enabled ? 1.0 : 0.5
    }
}
