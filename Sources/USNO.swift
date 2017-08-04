//
//  USNO.swift
//  Solar
//
//  Created by Олег on 04.08.17.
//  Copyright © 2017 Chris Howell. All rights reserved.
//

import Foundation

public enum USNOZenith : Double {
    
    case official = 90.83
    case civil = 96
    case nautical = 102
    case astronomical = 108
    
}

public struct USNOCalculation : SolarCalculation {
    
    public let sunriseSunset: SunriseSunset
    public let zenithValue: USNOZenith
    
    public static func sunrise(zenith: USNOZenith) -> USNOCalculation {
        return USNOCalculation(sunriseSunset: .sunrise, zenithValue: zenith)
    }
    
    public static func sunset(zenith: USNOZenith) -> USNOCalculation {
        return USNOCalculation(sunriseSunset: .sunset, zenithValue: zenith)
    }
    
    public var zenith: Double {
        return zenithValue.rawValue
    }
    
}

public extension Solar where Calculation == USNOCalculation {
    
    public var sunrise: Date? {
        return calculate(.sunrise(zenith: .official))
    }
    
    public var sunset: Date? {
        return calculate(.sunset(zenith: .official))
    }
    
    public var civilSunrise: Date? {
        return calculate(.sunrise(zenith: .civil))
    }
    
    public var civilSunset: Date? {
        return calculate(.sunset(zenith: .civil))
    }
    
    public var nauticalSunrise: Date? {
        return calculate(.sunrise(zenith: .nautical))
    }
    
    public var nauticalSunset: Date? {
        return calculate(.sunset(zenith: .nautical))
    }
    
    public var astronomicalSunrise: Date? {
        return calculate(.sunrise(zenith: .astronomical))
    }
    
    public var astronomicalSunset: Date? {
        return calculate(.sunset(zenith: .astronomical))
    }
    
}
