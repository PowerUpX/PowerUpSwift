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
    
    func testIsValidIP() {
        XCTAssert("10.7.100.182".isValidIP, "10.7.100.182 should be recognized as a VALID IP address.")
        XCTAssert("asdfghjkl".isValidIP == false, "asdfghjkl should be recognized as an INVALID IP address.")
    }
    
    func testIsNotValidIP() {
        XCTAssert("10.7.100.182".isNotValidIP == false, "10.7.100.182 should be recognized as an INVALID IP address.")
        XCTAssert("asdfghjkl".isNotValidIP, "asdfghjkl should be recognized as a VALID IP address.")
    }
    
    func testIsValidMAC() {
        XCTAssert("00:01:12:44:55:22".isValidMAC, "00:01:12:44:55:22 should be recognized as a VALID MAC address.")
        XCTAssert("asdfghjkl".isValidMAC == false, "asdfghjkl should be recognized as an INVALID MAC address.")
    }
    
    func testIsNotValidMAC() {
        XCTAssert("00:01:12:44:55:22".isNotValidMAC == false, "00:01:12:44:55:22 should be recognized as an INVALID MAC address.")
        XCTAssert("asdfghjkl".isNotValidMAC, "asdfghjkl should be recognized as a VALID MAC address.")
    }
}
