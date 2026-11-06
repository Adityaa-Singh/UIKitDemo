//
//  AppKeychainManager.swift
//  Aditya Tes
//
//  Created by Kamal Saini on 02/05/26.
//

import Foundation
//import Security

final class AppKeychain {

    enum Key: String {
        case accessToken
        case refreshToken
        case uuid
        case userPassword
    }
}


extension AppKeychain {

    static func save(value: String, forKey key: Key) {
        let data = value.data(using: .utf8)!

        removeValue(forKey: key)

        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key.rawValue,
            kSecValueData as String: data
        ]

        SecItemAdd(query as CFDictionary, nil)
    }

    static func value(forKey key: Key) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key.rawValue,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var item: CFTypeRef?

        let status = SecItemCopyMatching(query as CFDictionary, &item)

        guard status == errSecSuccess,
              let data = item as? Data,
              let value = String(data: data, encoding: .utf8)
        else {
            return nil
        }

        return value
    }

    static func removeValue(forKey key: Key) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key.rawValue
        ]

        SecItemDelete(query as CFDictionary)
    }

    static func removeAllValues() {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword
        ]

        SecItemDelete(query as CFDictionary)
    }
}
