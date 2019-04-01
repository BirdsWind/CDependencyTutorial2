//
//  CDependencyTutorial2Tests.swift
//  CDependencyTutorial2Tests
//
//  Created by ceciliah on 2/26/31 H.
//  Copyright © 31 Heisei Humlan. All rights reserved.
//

import XCTest
import CDependencyTutorial2

class CDependencyTutorial2Tests: XCTestCase {

    func testMacro() {
        let result = getMax(x: 1, y: 2)
        XCTAssertEqual(result, 2)
    }

    func testGlobalVariable() {
       print("Version is \(versionNumber)")
    }

    func testFunction() {
        let result = randomString(size: 5)
        print("result is \(result)")
    }

    func testStruct() {
        let nationality = Nationality(identifier: 123, country: "Sweden")
        nationality.printCountry()
        XCTAssertEqual(nationality.country, "Sweden")
    }

    func testEnum() {
        let result = todayIs()
        //This gets the simulators locale
        //https://developer.apple.com/documentation/foundation/nscalendar/unit/1416394-weekday
        let SResult = Calendar.current.dateComponents([.weekday], from: Date()).weekday! - 1
        XCTAssertEqual(result.rawValue, SResult)
    }

    func testFunctionalPointer() {
        func local(startValue: Int) -> Int {
            return startValue * startValue
        }
        let result = functionPointer(startValue: 5, getNextValue: local)
        XCTAssertEqual(result, 25)
    }
}
