//
//  ShortcutsManagerTests.swift
//  goggles
//
//  Created by Joy Paul on 10/7/24.
//

import XCTest
@testable import goggles
import Cocoa

final class ShortcutsManagerTests: XCTestCase {
    var shortcutsManager: ShortcutsManager!

    override func setUp() {
        super.setUp()
        shortcutsManager = ShortcutsManager.shared
    }

    override func tearDown() {
        shortcutsManager.stopRegisteringShortcuts()
        shortcutsManager = nil
        super.tearDown()
    }

    func testStartRegisteringShortcuts() {
        shortcutsManager.startRegisteringShortcuts()

        for keyCode in HandledKeyCodes.allCases {
            XCTAssertNotNil(shortcutsManager.monitors[keyCode], "Monitor for key code \(keyCode) should be registered.")
        }
    }

    func testStopRegisteringShortcuts() {
        shortcutsManager.startRegisteringShortcuts()
        shortcutsManager.stopRegisteringShortcuts()

        for keyCode in HandledKeyCodes.allCases {
            XCTAssertNil(shortcutsManager.monitors[keyCode], "Monitor for key code \(keyCode) should be unregistered.")
        }
    }
}
