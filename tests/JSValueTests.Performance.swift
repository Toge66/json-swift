//
//  JSValueTests.Performance.swift
//  JSON
//
//  Created by David Owens II on 8/15/14.
//  Copyright (c) 2014 Kiad Software. All rights reserved.
//

import Cocoa
import XCTest
import JSONLib

class JSValuePerformanceTests: XCTestCase {

    func testSampleJSON_JSONLib() {
        let path = NSBundle(forClass: JSValuePerformanceTests.self).pathForResource("sample", ofType: "json")
        XCTAssertNotNil(path)
        
        let string = NSString.stringWithContentsOfFile(path, encoding: NSUTF8StringEncoding, error: nil)
        XCTAssertNotNil(string)
        
        self.measureBlock() {
            let json = JSON.parse(string)
            XCTAssertFalse(json.failed)
        }
    }

    func testSampleJSON_NSJSONSerialization() {
        let path = NSBundle(forClass: JSValuePerformanceTests.self).pathForResource("sample", ofType: "json")
        XCTAssertNotNil(path)
        
        let string = NSString.stringWithContentsOfFile(path, encoding: NSUTF8StringEncoding, error: nil)
        XCTAssertNotNil(string)
        
        let data = string.dataUsingEncoding(NSUTF8StringEncoding)
        XCTAssertNotNil(data)
        
        self.measureBlock() {
            let json: AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil)
            XCTAssertTrue(json != nil)
        }
    }

}