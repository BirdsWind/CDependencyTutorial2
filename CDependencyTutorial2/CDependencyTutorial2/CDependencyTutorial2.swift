//
//  CDependencyTutorial2.swift
//  CDependencyTutorial2
//
//  Created by ceciliah on 2/26/31 H.
//  Copyright © 31 Heisei Humlan. All rights reserved.
//

import Foundation
import CWrapper


// MARK: Macro

public func getMax(x:Int, y:Int) -> Int {
    return Int(maxInt(Int32(x), Int32(y)))
}

public func getMax(x:Float, y:Float) -> Float {
    return maxFloat(x, y)
}

public func getMax(x:Double, y:Double) -> Double {
    return maxDouble(x, y)
}

// MARK: Global variable

public let versionNumber = CWrapper.versionNumber

// MARK: Function

//Relavant read https://developer.apple.com/documentation/swift/imported_c_and_objective-c_apis/using_imported_c_functions_in_swift
public func randomString(size: Int) -> String {
    assert(size > 0)
    let str = CWrapper.randomString(Int32(size))!
    //TODO: why deallocate - I forgot that again
    defer {
        str.deallocate()
    }
    return String(cString: str)
}

// MARK: Struct
public struct Nationality {
    let identifier: Int
    public let country: String
    
    private var cStruct: CWrapper.Nationality {
        return country.withCString{ (ptstr) -> CWrapper.Nationality in
            return CWrapper.Nationality(
                identifier: Int32(identifier),
                country: UnsafeMutablePointer(mutating: ptstr))
        }
    }
    
    public func printCountry() {
        var mutableVariable = cStruct
        CWrapper.print_nationlity_country(&mutableVariable)
    }
    
    public init(identifier: Int, country: String) {
        self.identifier = identifier
        self.country = country
    }
}

// MARK: Enum

public enum Week: Int {
    case 月曜日, 火曜日, 水曜日, 木曜日, 金曜日, 土曜日, 日曜日

    init(weekDay: CWrapper.曜日) {
        switch weekDay {
        case CWrapper.月曜日:
            self = .月曜日
        case CWrapper.火曜日:
            self = .火曜日
        case CWrapper.水曜日:
            self = .水曜日
        case CWrapper.木曜日:
            self = .木曜日
        case CWrapper.金曜日:
            self = .金曜日
        case CWrapper.土曜日:
            self = .土曜日
        case CWrapper.日曜日:
            self = .日曜日
        default:
            fatalError()
        }
    }

    var cWeekDay: CWrapper.曜日 {
        get {
            switch self {
            case .月曜日:
                return CWrapper.月曜日
            case .火曜日:
                return CWrapper.火曜日
            case .水曜日:
                return CWrapper.水曜日
            case .木曜日:
                return CWrapper.木曜日
            case .金曜日:
                return CWrapper.金曜日
            case .土曜日:
                return CWrapper.土曜日
            case .日曜日:
                return CWrapper.日曜日
            }
        }
    }

    //From C->Swift
    public func printWeekDay() {
        print("C week day is \(cWeekDay)")
        let swiftWeekDay = Week(weekDay: cWeekDay)
        print(" swift week day is \(swiftWeekDay)")
    }
}

//From C->Swift
public func todayIs() -> Week {
    let CDay = CWrapper.currentDayOfWeek()
    let SDay = Week(weekDay: CDay)
    print("day string is \(SDay)")
    return SDay
}

// MARK: Functional pointer
var globalClosure: ((Int)->Int)?

public func functionPointer(startValue: Int, getNextValue: @escaping (Int)->Int) ->Int {
    globalClosure = getNextValue

    func localClosure(val: Int32) -> Int32 {
        return Int32(globalClosure!(Int(val)))
    }

    return Int(CWrapper.functionPointer(Int32(startValue), localClosure))
}
