//
//  Log.swift
//  SideProjecBluetooth
//
//  Created by Pawel Kacela on 23/04/2022.
//

import Foundation

open class Log {
    
    static let kLoggerEnabled = true
    
    public static let sharedInstance = Log()
    fileprivate init() {}
    
    open class func d(tag: String, message: String?) {
        if let message = message, kLoggerEnabled {
            print("📗DEBUG\t\(tag)\t\(message)")
        }
    }
    
    open class func e(tag: String, message: String?) {
        if let message = message, kLoggerEnabled {
            print("📕ERROR\t\(tag)\t\(message)")
        }
    }
    
    open class func i(tag: String, message: String?) {
        if let message = message, kLoggerEnabled {
            print("📘INFO\t\(tag)\t\(message)")
        }
    }
    
    open class func w(tag: String, message: String?) {
        if let message = message, kLoggerEnabled {
            print("📙WARN\t\(tag)\t\(message)")
        }
    }
    
    open class func dev(message: Any?) {
        if let message = message {
            print("🛑\(message)")
        }
    }
}

