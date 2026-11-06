//
//  AppUserDefaultManager.swift
//  Aditya Tes
//
//  Created by Kamal Saini on 02/05/26.
//

import Foundation

class AppUserDefaults {
    
    enum Key: String {
        case serverConfiguration
        case uuid
        case isLogin
        case access_token
        case preferredLanguage
        case emailId

    }
}

extension AppUserDefaults {
        
    static func value<T>(forKey key: Key, fallBackValue: T, file: String = #file, line: Int = #line, function: String = #function) -> Any {
        guard let value = UserDefaults.standard.object(forKey: key.rawValue) else {
            print("No Value Found in UserDefaults\nFile : \(file) \nFunction : \(function)")
            return fallBackValue
        }
        
        return value
    }
    
    static func save(value: Any, forKey key: Key) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    static func removeValue(forKey key: Key) {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    static func removeAllValues() {
        let appDomain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: appDomain)
        UserDefaults.standard.synchronize()
    }
}
