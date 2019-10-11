//
//  ViewController.swift
//  SberStorageHW
//
//  Created by Эмиль Шалаумов on 10/10/2019.
//  Copyright © 2019 Emil Shalaumov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let storage = Storage()

        // Set values
        let booleanValue = true
        storage.save(object: booleanValue, for: "first")
        
        let intValue = 43
        storage.save(object: intValue, for: "second")
        
        let stringValue = "This is a string"
        storage.save(object: stringValue, for: "third")
        
        // Get value
        let getFirst: Result<Bool, Error> = storage.get(for: "first")
        switch getFirst  {
        case .success(let message): print(message)
        case .failure(let error): print(error)
        }
        
        // Try to get not existing object
        let getNotExisting: Result<Bool, Error> = storage.get(for: "fourth")
        switch getNotExisting  {
        case .success(let message): print(message)
        case .failure(let error): print(error)
        }
        
        // Try to get the value of wrong type
        let getWrongType: Result<Int, Error> = storage.get(for: "third")
        switch getWrongType  {
        case .success(let message): print(message)
        case .failure(let error): print(error)
        }
    }


}

