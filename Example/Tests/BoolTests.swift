//
//  BoolTests.swift
//  PowerUpSwift_Tests
//
//  Created by Ceferino Jose II on 11/10/18.
//  Copyright © 2018 Ceferino Jose II. All rights reserved.
//

import XCTest
import PowerUpSwift

class BoolTests: XCTestCase {
    func testBool() {
        XCTAssertFalse(Bool(0), "Bool(0) must be false.")
        XCTAssertTrue(Bool(1), "Bool(1) must be true.")
        XCTAssertTrue(Bool(2), "Bool(2) must be true.")
        XCTAssertTrue(Bool(-1), "Bool(-1) must be true.")
    }
}
