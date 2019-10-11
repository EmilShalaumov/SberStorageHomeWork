//
//  Storage.swift
//  SberStorageHW
//
//  Created by Эмиль Шалаумов on 10/10/2019.
//  Copyright © 2019 Emil Shalaumov. All rights reserved.
//

import Foundation

class Storage {
    typealias Key = String
    
    func save<T>(object: T, for key: Key) {
        UserDefaults.standard.set(object, forKey: key)
    }
    
    func get<T>(for key: Key) -> Result<T, Error> {
        let object = UserDefaults.standard.object(forKey: key)
        if object == nil {
            return .failure(DefaultsError.noValueError)
        }
        if let object = object as? T {
            return.success(object)
        }
        return .failure(DefaultsError.wrongTypeError)
    }
}

enum DefaultsError: Error {
    case wrongTypeError
    case noValueError
}
