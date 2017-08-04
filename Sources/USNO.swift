//
//  USNO.swift
//  Solar
//
//  Created by Олег on 04.08.17.
//  Copyright © 2017 Chris Howell. All rights reserved.
//

import Foundation

public enum USNOZenith : Double, ZenithProtocol {
    
    case official = 90.83
    case civil = 96
    case nautical = 102
    case astronomical = 108
    
    public var zenith: Double {
        return rawValue
    }
    
}

public extension Solar where Zenith == USNOZenith {
    
    public var sunrise: Date? {
        return calculate(zenith: .official, at: .sunrise)
    }
    
    public var sunset: Date? {
        return calculate(zenith: .official, at: .sunset)
    }
    
    public var civilSunrise: Date? {
        return calculate(zenith: .civil, at: .sunrise)
    }
    
    public var civilSunset: Date? {
        return calculate(zenith: .civil, at: .sunset)
    }
    
    public var nauticalSunrise: Date? {
        return calculate(zenith: .nautical, at: .sunrise)
    }
    
    public var nauticalSunset: Date? {
        return calculate(zenith: .nautical, at: .sunset)
    }
    
    public var astronomicalSunrise: Date? {
        return calculate(zenith: .astronomical, at: .sunrise)
    }
    
    public var astronomicalSunset: Date? {
        return calculate(zenith: .astronomical, at: .sunset)
    }
    
}
