//
//  SolarTests.swift
//  SolarTests
//
//  Created by Chris Howell on 08/02/2017.
//  Copyright © 2017 Chris Howell. All rights reserved.
//

import XCTest

@testable
import Solar

typealias USNOSolar = Solar<USNOZenith>

final class SolarTests: XCTestCase {
    
    private let testDate = Date(timeIntervalSince1970: 1486598400)
    
    /// How accurate, in minutes either side of the actual sunrise sunset, we want to be
    /// This is necessary as the algorithm uses assumptions during calculation
    private let testAccuracy: TimeInterval = 60 * 5
    
    private lazy var cities: [City] = {
        guard
            let resultsURLString = Bundle(for: type(of: self)).path(forResource: "CorrectResults", ofType: "json"),
            let resultsURL = URL(string: "file:///" + resultsURLString),
            let data = try? Data(contentsOf: resultsURL),
            let dictionary = try? JSONSerialization.jsonObject(with: data, options: []),
            let cityDictionaries = dictionary as? [[String : Any]]
        else {
            fatalError("Correct results JSON doesn't appear to be included in the test bundle.")
        }
        return cityDictionaries.map(City.init(json:))
    }()
    
    func testSunrise() {
        for city in cities {
            let solar = USNOSolar(for: testDate, latitude: city.latitude, longitude: city.longitude)
            
            guard
                let sunrise = solar?.sunrise
            else {
                XCTFail("Sunrise cannot be generated for city \(city.name)")
                return
            }
            
            XCTAssertEqualWithAccuracy(sunrise.timeIntervalSince1970, city.sunrise.timeIntervalSince1970, accuracy: testAccuracy, "\(city.name): \(sunrise) not close to \(city.sunrise)")
        }
    }
    
    func testSunrise_isNil_whenNoSunriseOccurs() {
        let solar = USNOSolar(for: testDate, latitude: 78.2186, longitude: 15.64007) // Location: Longyearbyen
        XCTAssertNotNil(solar)
        XCTAssertNil(solar?.sunrise)
    }
    
    func testSunset() {
        for city in cities {
            let solar = USNOSolar(for: testDate, latitude: city.latitude, longitude: city.longitude)
            
            guard
                let sunset = solar?.sunset
            else {
                XCTFail("Sunset cannot be generated for city \(city.name)")
                return
            }
            
            XCTAssertEqualWithAccuracy(sunset.timeIntervalSince1970, city.sunset.timeIntervalSince1970, accuracy: testAccuracy, "\(city.name): \(sunset) not close to \(city.sunset)")
        }
    }
    
    func testSunset_isNil_whenNoSunsetOccurs() {
        let solar = USNOSolar(for: testDate, latitude: 78.2186, longitude: 15.64007) // Location: Longyearbyen
        XCTAssertNotNil(solar)
        XCTAssertNil(solar?.sunset)
    }
    
}
