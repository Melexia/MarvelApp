//
//
// Singleton.swift
// MarvelApp
//
// Using Swift 5.0
//
// Created by Andrea Sánchez Román on 28/09/21.
// Copyright (c) 2021 and Confidential to Melexia All rights reserved.
//


import Foundation

import Alamofire
import UIKit

open class Singleton: NSObject {
    static let instance: Singleton = {
        let instance = Singleton()
        return instance
    }()
    
    override init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = TimeInterval(60)
        configuration.timeoutIntervalForResource = TimeInterval(60)
        manager =  Alamofire.Session(configuration: configuration)
    }
    
    // MARK: ALAMOFIRE
    var manager: Session?

    
    
}
