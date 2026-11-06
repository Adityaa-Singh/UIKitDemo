//
//  UILabel+Extension.swift
//  Aditya Tes
//
//  Created by Kamal Saini on 04/05/26.
//

import Foundation
import UIKit

extension UILabel {

    func configureLabel(
        text: String? = nil,
        textColor: UIColor = .label,
        fontName: String? = nil,
        fontSize: CGFloat = 16,
        alignment: NSTextAlignment = .left,
        numberOfLines: Int = 1
    ) {

        self.text = text
        self.textColor = textColor
        self.textAlignment = alignment
        self.numberOfLines = numberOfLines

        if let fontName = fontName {
            self.font = UIFont(name: fontName, size: fontSize)
                ?? UIFont.systemFont(ofSize: fontSize)
        } else {
            self.font = UIFont.systemFont(ofSize: fontSize)
        }
    }

    func setLineSpacing(_ spacing: CGFloat) {
        guard let text = self.text else { return }

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacing

        let attributedString = NSMutableAttributedString(
            string: text
        )

        attributedString.addAttribute(
            .paragraphStyle,
            value: paragraphStyle,
            range: NSRange(location: 0, length: attributedString.length)
        )

        self.attributedText = attributedString
    }
}

