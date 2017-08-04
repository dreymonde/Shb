//
//  Shb.swift
//  Shb
//
//  Created by Олег on 04.08.17.
//  Copyright © 2017 Shb. All rights reserved.
//

import Foundation

public enum ShabbatCalculation : Double, SolarCalculation {
    
    public static let CandlesBeforeSunsetInterval: TimeInterval = 18 * 60
    
    case shabbatStarts = 90.83
    case shabbatEnds = 98
    
    public var zenith: Double {
        return rawValue
    }
    
    public var sunriseSunset: SunriseSunset {
        return .sunset
    }
    
}

public typealias Shb = Solar<ShabbatCalculation>

public extension Solar where Calculation == ShabbatCalculation {
    
    public var shabbatStarts: Date? {
        return calculate(.shabbatStarts)
    }
    
    public var shabbatEnds: Date? {
        return calculate(.shabbatEnds)
    }
    
    public var lightCandles: Date? {
        return shabbatStarts?.addingTimeInterval(-ShabbatCalculation.CandlesBeforeSunsetInterval)
    }
    
}
