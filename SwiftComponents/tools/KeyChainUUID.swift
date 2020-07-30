//
//  KeyChain.swift
//  RongZhiTrack
//
//  Created by liangze on 2019/12/4.
//  Copyright © 2019 liangze. All rights reserved.
//

import UIKit

struct KeychainUUID {
    static let current = KeychainUUID()
    
    enum KeychainError: Error {
        case unSerializetionPassword
        case unhandledError(status: OSStatus)
    }
    
    private let accountKey = "rongzhi_account"
    private let serviceKey = "rongzhi_sevice"
    
    func uuid() throws -> String {
        return try idFromKeyChain()
    }
    
    private func newStoredID() throws -> String {
        let uuid = UIDevice.current.identifierForVendor?.uuidString ?? NSUUID().uuidString
        let password = uuid.data(using: .utf8)!
        
        let query: [String: Any] = [
                    kSecClass as String: kSecClassInternetPassword,
                    kSecAttrAccount as String: accountKey,
                    kSecAttrServer as String: serviceKey,
                    kSecValueData as String: password
                ]
        let status = SecItemAdd(query as CFDictionary, nil)
        guard status == errSecSuccess else {
            throw KeychainError.unhandledError(status: status)
        }

        return uuid
    }
    
    private func idFromKeyChain() throws -> String {
        let query: [String: Any] = [
            kSecClass as String: kSecClassInternetPassword,
            kSecAttrServer as String: serviceKey,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnAttributes as String: true,
            kSecReturnData as String: true
        ]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        // 没有密码
        guard status != errSecItemNotFound else {
            return try newStoredID()
        }
        
        guard status == errSecSuccess else {
            throw KeychainError.unhandledError(status: status)
        }
        
        guard let existingItem = item as? [String : Any], let data = existingItem[kSecValueData as String] as? Data, let uuid = String(data: data, encoding: String.Encoding.utf8) else {
            throw KeychainError.unSerializetionPassword
        }
        return uuid
    }
}
