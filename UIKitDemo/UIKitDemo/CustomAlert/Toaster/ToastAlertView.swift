//
//  ToastAlertView.swift
//  Aditya Tes
//
//  Created by Kamal Saini on 02/05/26.
//

import Foundation
import UIKit

class ToastAlertView: UIView {
    
    @IBOutlet weak var labelToastMessage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        NotificationCenter.default.addObserver(self, selector: #selector(rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func rotated() {
        self.removeFromSuperview()
    }

}
