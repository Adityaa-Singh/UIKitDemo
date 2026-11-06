//
//  TextField+Extension.swift
//  Aditya Tes
//
//  Created by Kamal Saini on 04/05/26.
//

import Foundation
import UIKit

extension UITextField {

    func configureTextField(
        placeholder: String,
        placeholderColor: UIColor = .placeholderText,
        textColor: UIColor = .label,
        fontName: String = "System",
        fontSize: CGFloat = 16,
        borderStyle: UITextField.BorderStyle = .roundedRect,
        backgroundColor: UIColor = .systemBackground
    ) {

        self.borderStyle = borderStyle
        self.backgroundColor = backgroundColor
        self.textColor = textColor

        // Configure Font
        if fontName == "System" {
            self.font = UIFont.systemFont(ofSize: fontSize)
        } else {
            self.font = UIFont(name: fontName, size: fontSize)
                ?? UIFont.systemFont(ofSize: fontSize)
        }

        // Configure Placeholder
        self.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [
                .foregroundColor: placeholderColor
            ]
        )
    }

    func configureTextFieldWithBackground(
        placeholder: String,
        placeholderColor: UIColor = .placeholderText,
        textColor: UIColor = .label,
        fontName: String = "System",
        fontSize: CGFloat = 16,
        backgroundColor: UIColor = .secondarySystemBackground
    ) {

        configureTextField(
            placeholder: placeholder,
            placeholderColor: placeholderColor,
            textColor: textColor,
            fontName: fontName,
            fontSize: fontSize,
            borderStyle: .none,
            backgroundColor: backgroundColor
        )
    }
    
    func setLeftPadding(_ value: CGFloat) {
        let padding = UIView(
            frame: CGRect(x: 0, y: 0, width: value, height: self.frame.height)
        )

        self.leftView = padding
        self.leftViewMode = .always
    }

    func setRightPadding(_ value: CGFloat) {
        let padding = UIView(
            frame: CGRect(x: 0, y: 0, width: value, height: self.frame.height)
        )

        self.rightView = padding
        self.rightViewMode = .always
    }

    func setSecureEntry(_ enabled: Bool) {
        self.isSecureTextEntry = enabled
    }
}
