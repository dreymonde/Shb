//
//  ShbTests.swift
//  Shb
//
//  Created by Oleg Dreyman on 04.08.17.
//  Copyright © 2017 Shb. All rights reserved.
//

import Foundation
import XCTest
import Shb

class ShbTests: XCTestCase {
    
    func testShabbatKharkiv() {
        let aug4_2017 = Date(timeIntervalSince1970: 1501835467)
        let shb_fri = Shb(date: aug4_2017, latitude: 49.988358, longitude: 36.232845)!
        let presumedCandles = Date(timeIntervalSince1970: 1501865580)
        XCTAssertEqualWithAccuracy(shb_fri.lightCandles!.timeIntervalSince1970, presumedCandles.timeIntervalSince1970, accuracy: SolarTests.testAccuracy)
        let presumedStart = Date(timeIntervalSince1970: 1501866720)
        XCTAssertEqualWithAccuracy(shb_fri.shabbatStarts!.timeIntervalSince1970, presumedStart.timeIntervalSince1970, accuracy: SolarTests.testAccuracy)
        let presumedEnd = Date(timeIntervalSince1970: 1501956540)
        let shb_sat = Shb(date: aug4_2017.addingTimeInterval(86400), latitude: 49.988358, longitude: 36.232845)!
        XCTAssertEqualWithAccuracy(shb_sat.shabbatEnds!.timeIntervalSince1970, presumedEnd.timeIntervalSince1970, accuracy: SolarTests.testAccuracy)
    }
    
}
