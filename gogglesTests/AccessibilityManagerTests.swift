//
//  AccessibilityManagerTests.swift
//  goggles
//
//  Created by Joy Paul on 10/7/24.
//

import XCTest
@testable import goggles

final class AccessibilityManagerTests: XCTestCase {
    var accessibilityManager: AccessibilityManager!
    
    override func setUp() {
        super.setUp()
        accessibilityManager = AccessibilityManager()
        accessibilityManager.isAccessEnabled = false
    }
    
    override func tearDown() {
        accessibilityManager = nil
        super.tearDown()
    }
    
    func testisAccessEnabledFalsy() {
        XCTAssertFalse(accessibilityManager.isAccessEnabled, "Access should remain disabled.")
    }
}
