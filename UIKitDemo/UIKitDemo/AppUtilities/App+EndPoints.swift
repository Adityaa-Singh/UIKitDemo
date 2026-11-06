//
//  App+EndPoints.swift
//  Aditya Tes
//
//  Created by Kamal Saini on 02/05/26.
//

import Foundation
import UIKit

extension AppNetworkManager {
    
    enum EndPoint: String {
        
        case configuration = "api/user/configuration"
        case userOtp = "api/user/otp"
        case validateOtp = "api/user/on-board/otp-validate"
        case signUp = "api/user/signup"
        
        
        var url: String {
            return "\(BASEURL)\(self.rawValue)"
        }
    }
        
}
