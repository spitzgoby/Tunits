//
//  TimeUnitTests.swift
//  Tunits
//
//  Created by Tom on 9/4/15.
//  Copyright (c) 2015 CocoaPods. All rights reserved.
//
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Tunits
import XCTest

class TimeUnitTests: XCTestCase {
    private var dateFormatter : NSDateFormatter = NSDateFormatter()
    
    private var utilities : TimeUnitTestsUtilities = TimeUnitTestsUtilities()
    
    override func setUp() {
        self.dateFormatter = NSDateFormatter()
        self.dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    }
    
    // MARK: - Initialization And Default Properties
    func testTimeUnitCanBeInitialized() {
        XCTAssertNotNil(TimeUnit())
    }
    
    func testSharedInstanceIsNotNil() {
        XCTAssertNotNil(TimeUnit.sharedInstance)
    }
    
    func testCalendarIsSetWithConvenienceInitializer() {
        let calendar : NSCalendar = self.utilities.calendarWithSundayAsFirstWeekday()
        XCTAssertEqual(calendar, TimeUnit(calendar:calendar).calendar)
    }
    
    func testTimeUnitHasAutoUpdatingCurrentCalendarByDefault() {
        XCTAssertEqual(TimeUnit().calendar, NSCalendar.autoupdatingCurrentCalendar())
    }
    
    func testStaticTimeUnitHasAutoUpdatingCurrentCalendarByDefault() {
        XCTAssertEqual(TimeUnit.sharedInstance.calendar, NSCalendar.autoupdatingCurrentCalendar())
    }
    
    func testTimeUnitCalendarCanBeChanged() {
        let calendar = NSCalendar.currentCalendar()
        let tunit = TimeUnit()
        tunit.calendar = calendar
        XCTAssertEqual(calendar, tunit.calendar)
    }
    
    func testStaticTimeUnitCalendarCanBeChanged() {
        let calendar = NSCalendar.currentCalendar()
        TimeUnit.setStaticCalendar(calendar)
        XCTAssertEqual(TimeUnit.sharedInstance.calendar, calendar)
    }
}