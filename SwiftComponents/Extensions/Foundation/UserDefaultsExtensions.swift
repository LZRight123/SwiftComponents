//
//  File.swift
//  JZT_SUPPLIER
//
//  Created by 梁泽 on 2018/11/17.
//  Copyright © 2018 com.FBBC.JoinTown. All rights reserved.
//

import Foundation

public extension UserDefaults {
    struct Key<Value> {
        var name: String
    }
    
    subscript<T>(key: Key<T>) -> T? {
        get {
            return value(forKey: key.name) as? T
        }
        set {
            setValue(newValue, forKey: key.name)
        }
    }
    
    /*use:
     let result =  UserDefaults.standard[.test]
      UserDefaults.standard[.test] = true
     let ruslut =  UserDefaults.standard[.test, default: false]
    */
    subscript<T>(key: Key<T>, default defaultProvider: @autoclosure () -> T) -> T {
        get {
            return value(forKey: key.name) as? T ?? defaultProvider()
        }
        set {
            setValue(newValue, forKey: key.name)
        }
    }
    
    /// SwifterSwift: get object from UserDefaults by using subscript
    ///
    /// - Parameter key: key in the current user's defaults database.
    subscript(key: String) -> Any? {
        get {
            return object(forKey: key)
        }
        set {
            set(newValue, forKey: key)
        }
    }

    /// SwifterSwift: Float from UserDefaults.
    ///
    /// - Parameter forKey: key to find float for.
    /// - Returns: Float object for key (if exists).
    func float(forKey key: String) -> Float? {
        return object(forKey: key) as? Float
    }

    /// SwifterSwift: Date from UserDefaults.
    ///
    /// - Parameter forKey: key to find date for.
    /// - Returns: Date object for key (if exists).
    func date(forKey key: String) -> Date? {
        return object(forKey: key) as? Date
    }

    /// SwifterSwift: Retrieves a Codable object from UserDefaults.
    ///
    /// - Parameters:
    ///   - type: Class that conforms to the Codable protocol.
    ///   - key: Identifier of the object.
    ///   - decoder: Custom JSONDecoder instance. Defaults to `JSONDecoder()`.
    /// - Returns: Codable object for key (if exists).
    func object<T: Codable>(_ type: T.Type, with key: String, usingDecoder decoder: JSONDecoder = JSONDecoder()) -> T? {
        guard let data = value(forKey: key) as? Data else { return nil }
        return try? decoder.decode(type.self, from: data)
    }

    /// SwifterSwift: Allows storing of Codable objects to UserDefaults.
    ///
    /// - Parameters:
    ///   - object: Codable object to store.
    ///   - key: Identifier of the object.
    ///   - encoder: Custom JSONEncoder instance. Defaults to `JSONEncoder()`.
    func set<T: Codable>(object: T, forKey key: String, usingEncoder encoder: JSONEncoder = JSONEncoder()) {
        let data = try? encoder.encode(object)
        set(data, forKey: key)
    }

}

public extension UserDefaults.Key {
    static var tests: UserDefaults.Key<[String]> {
        return .init(name: "tests")
    }
    
    static var test: UserDefaults.Key<Bool> {
        return .init(name: "test")
    }
}



