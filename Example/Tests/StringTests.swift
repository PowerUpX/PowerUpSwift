//
//  StringTests.swift
//  PowerUpSwift_Tests
//
//  Created by Ceferino Jose II on 10/9/18.
//  Copyright © 2018 Ceferino Jose II. All rights reserved.
//

import XCTest
import PowerUpSwift

class StringTests: XCTestCase {
    func testIsEmailValid() {
        XCTAssert("cefjoeii@gmail.com".isValidEmail, "cefjoeii@gmail.com should be recognized as a VALID email.")
        XCTAssert("asdfghjkl".isValidEmail == false, "asdfghjkl should be recognized as an INVALID email.")
    }
    
    func testIsNotEmailValid() {
        XCTAssert("cefjoeii@gmail.com".isNotValidEmail == false, "cefjoeii@gmail.com should be recognized as a VALID email.")
        XCTAssert("asdfghjkl".isNotValidEmail, "asdfghjkl should be recognized as an INVALID email.")
    }
}
