//
//  String+Extension.swift
//  Aditya Tes
//
//  Created by Kamal Saini on 02/05/26.
//

import Foundation
import UIKit

extension String {
    
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
    
    func sizeOfString (constrainedToWidth width: CGFloat, font: UIFont) -> CGSize {
        return NSString(string: self).boundingRect(with: CGSize(width: width, height: .greatestFiniteMagnitude),
                                                   options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                                   attributes: [NSAttributedString.Key.font: font],
                                                   context: nil).size
    }
    
    func checkEmpty() -> String? {
        return isEmpty ? nil : self
    }
    
    func checkStringContainsNumberAndSpecialCharacters() -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z].*", options: .caseInsensitive)
            if let _ = regex.firstMatch(in: self, options: .reportCompletion, range: NSMakeRange(0, self.count)) {
                return true
            } else {
                return false
            }
        } catch {
            return false
        }
    }
    
    func checkStringContainsSpecialCharacters() -> Bool {
        let spacesFreeString = replacingOccurrences(of: " ", with: "")
        
        do {
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z0-9].*", options: .caseInsensitive)
            if let _ = regex.firstMatch(in: spacesFreeString, options: .reportCompletion, range: NSMakeRange(0, spacesFreeString.count)) {
                return true
            } else {
                return false
            }
        } catch {
            return false
        }
    }
    
    func checkMobileNumberStartsWith5OrLess() -> Bool {
        return (Int(self.prefix(1)) ?? 0) <= 5
    }
    
    func localizableString() -> String {
        let preferredLanguage: String? = AppUserDefaults.value(forKey: .preferredLanguage, fallBackValue: "en") as? String
        let path = Bundle.main.path(forResource: preferredLanguage, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
    
    func changeFormat(from: String, to: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = from
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = to
        return  dateFormatter.string(from: date!)
    }
    
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }

    mutating func capitalizeFirstLetter() {
      self = self.capitalizingFirstLetter()
    }
    
}

extension Data {
    
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var html2String: String { html2AttributedString?.string ?? "" }
}
