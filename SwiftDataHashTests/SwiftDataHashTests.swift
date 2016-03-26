//
//  SwiftDataHashTests.swift
//  SwiftDataHashTests
//
//  Created by William Kent on 1/6/15.
//  Copyright (c) 2015 William Kent. All rights reserved.
//

import Foundation
import XCTest
import SwiftDataHash

class SwiftDataHashTests: XCTestCase {
    // The implicitly-unwrapped optionals here are required, else the compiler complains.
    private var inputData: NSData!
    private var keyData: NSData!
    
    private func hashDataToHexString(data: NSData) -> String {
        let hexstr = NSMutableString()
        let bytes = UnsafePointer<UInt8>(data.bytes)
        
        for i in 0..<data.length {
            hexstr.appendFormat("%02x", bytes[i])
        }
        
        return hexstr as String
    }
    
    override func setUp() {
        let inputString = "test"
        if let input = inputString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true) {
            inputData = input
        } else {
            XCTFail("Could not get UTF-8 data of \(inputString)")
        }
        
        let inputKey = "key"
        if let key = inputKey.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true) {
            keyData = key
        } else {
            XCTFail("Could not get UTF-8 data of \(inputKey)")
        }
    }
    
    func testMD5Algorithm() {
        let computedHash = inputData.computeHashUsingAlgorithm(.MD5)
        let expectedHash = "098f6bcd4621d373cade4e832627b4f6"
        
        XCTAssertEqual(hashDataToHexString(computedHash), expectedHash, "MD5 hash function returned incorrect value")
    }
    
    func testSHA1Algorithm() {
        let computedHash = inputData.computeHashUsingAlgorithm(.SHA1)
        let expectedHash = "a94a8fe5ccb19ba61c4c0873d391e987982fbbd3"
        
        XCTAssertEqual(hashDataToHexString(computedHash), expectedHash, "SHA1 hash function returned incorrect value")
    }
    
    func testSHA224Algorithm() {
        let computedHash = inputData.computeHashUsingAlgorithm(.SHA224)
        let expectedHash = "90a3ed9e32b2aaf4c61c410eb925426119e1a9dc53d4286ade99a809"
        
        XCTAssertEqual(hashDataToHexString(computedHash), expectedHash, "SHA224 hash function returned incorrect value")
    }
    
    func testSHA256Algorithm() {
        let computedHash = inputData.computeHashUsingAlgorithm(.SHA256)
        let expectedHash = "9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08"
        
        XCTAssertEqual(hashDataToHexString(computedHash), expectedHash, "SHA256 hash function returned incorrect value")
    }
    
    func testSHA384Algorithm() {
        let computedHash = inputData.computeHashUsingAlgorithm(.SHA384)
        let expectedHash = "768412320f7b0aa5812fce428dc4706b3cae50e02a64caa16a782249bfe8efc4b7ef1ccb126255d196047dfedf17a0a9"
        
        XCTAssertEqual(hashDataToHexString(computedHash), expectedHash, "SHA384 hash function returned incorrect value")
    }
    
    func testSHA512Algorithm() {
        let computedHash = inputData.computeHashUsingAlgorithm(.SHA512)
        let expectedHash = "ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff"
        
        XCTAssertEqual(hashDataToHexString(computedHash), expectedHash, "SHA512 hash function returned incorrect value")
    }
    
    func testSignedMD5Algorithm() {
        let computedHash = inputData.computeSignedHashUsingAlgorithm(.MD5, HMACKey: keyData)
        let expectedHash = "1d4a2743c056e467ff3f09c9af31de7e"
        
        XCTAssertEqual(hashDataToHexString(computedHash), expectedHash, "MD5 HMAC hash function returned incorrect value")
    }
    
    func testSignedSHA1Algorithm() {
        let computedHash = inputData.computeSignedHashUsingAlgorithm(.SHA1, HMACKey: keyData)
        let expectedHash = "671f54ce0c540f78ffe1e26dcf9c2a047aea4fda"
        
        XCTAssertEqual(hashDataToHexString(computedHash), expectedHash, "SHA1 HMAC hash function returned incorrect value")
    }
    
    func testSignedSHA224Algorithm() {
        let computedHash = inputData.computeSignedHashUsingAlgorithm(.SHA224, HMACKey: keyData)
        let expectedHash = "76b34b643e71d7d92afd4c689c0949cbe0c5445feae907aac532a5a1"
        
        XCTAssertEqual(hashDataToHexString(computedHash), expectedHash, "SHA224 HMAC hash function returned incorrect value")
    }
    
    func testSignedSHA256Algorithm() {
        let computedHash = inputData.computeSignedHashUsingAlgorithm(.SHA256, HMACKey: keyData)
        let expectedHash = "02afb56304902c656fcb737cdd03de6205bb6d401da2812efd9b2d36a08af159"
        
        XCTAssertEqual(hashDataToHexString(computedHash), expectedHash, "SHA256 HMAC hash function returned incorrect value")
    }
    
    func testSignedSHA384Algorithm() {
        let computedHash = inputData.computeSignedHashUsingAlgorithm(.SHA384, HMACKey: keyData)
        let expectedHash = "160a099ad9d6dadb46311cb4e6dfe98aca9ca519c2e0fedc8dc45da419b1173039cc131f0b5f68b2bbc2b635109b57a8"
        
        XCTAssertEqual(hashDataToHexString(computedHash), expectedHash, "SHA384 HMAC hash function returned incorrect value")
    }
    
    func testSignedSHA512Algorithm() {
        let computedHash = inputData.computeSignedHashUsingAlgorithm(.SHA512, HMACKey: keyData)
        let expectedHash = "287a0fb89a7fbdfa5b5538636918e537a5b83065e4ff331268b7aaa115dde047a9b0f4fb5b828608fc0b6327f10055f7637b058e9e0dbb9e698901a3e6dd461c"
        
        XCTAssertEqual(hashDataToHexString(computedHash), expectedHash, "SHA512 HMAC hash function returned incorrect value")
    }
}
