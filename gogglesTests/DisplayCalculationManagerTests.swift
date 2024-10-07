//
//  Untitled.swift
//  goggles
//
//  Created by Joy Paul on 10/7/24.
//

import XCTest
@testable import goggles
import Cocoa

final class DisplayCalculationManagerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Inject a mock display size for testing 
        DisplayCalculationManager.currentDisplaySizeProvider = { CGSize(width: 1920, height: 1080) }
    }

    override func tearDown() {
        super.tearDown()
    }

    func testGetWindowPositionAndSizeForHorizontalLeft() {
            let expectedPosition = CGPoint(x: 0, y: 0)
            let expectedSize = CGSize(width: 1920 / 2, height: 1080)
            let result = DisplayCalculationManager.getWindowPositionAndSize(for: .horizontaLeft)

            XCTAssertEqual(result?.positionCoordinates, expectedPosition, "The position for horizontal left should be at the top-left corner.")
            XCTAssertEqual(result?.heightAndWidthCoordinates, expectedSize, "The size for horizontal left should be half the width of the screen and full height.")
        }

        func testGetWindowPositionAndSizeForFullscreen() {
            let expectedPosition = CGPoint(x: 0, y: 0)
            let expectedSize = CGSize(width: 1920, height: 1080)
            let result = DisplayCalculationManager.getWindowPositionAndSize(for: .fullscreen)

            XCTAssertEqual(result?.positionCoordinates, expectedPosition, "The position for fullscreen should be at the top-left corner.")
            XCTAssertEqual(result?.heightAndWidthCoordinates, expectedSize, "The size for fullscreen should match the display size.")
        }

        func testGetWindowPositionAndSizeForVerticalTop() {
            let expectedPosition = CGPoint(x: 0, y: 0)
            let expectedSize = CGSize(width: 1920, height: 1080 / 2)
            let result = DisplayCalculationManager.getWindowPositionAndSize(for: .verticalTop)

            XCTAssertEqual(result?.positionCoordinates, expectedPosition, "The position for vertical top should be at the top-left corner.")
            XCTAssertEqual(result?.heightAndWidthCoordinates, expectedSize, "The size for vertical top should be half the height of the screen and full width.")
        }

        func testGetWindowPositionAndSizeForHorizontalRight() {
            let expectedPosition = CGPoint(x: 1920 / 2, y: 0)
            let expectedSize = CGSize(width: 1920 / 2, height: 1080)
            let result = DisplayCalculationManager.getWindowPositionAndSize(for: .horizontalRight)

            XCTAssertEqual(result?.positionCoordinates, expectedPosition, "The position for horizontal right should be at the middle of the screen horizontally.")
            XCTAssertEqual(result?.heightAndWidthCoordinates, expectedSize, "The size for horizontal right should be half the width of the screen and full height.")
        }

        func testGetWindowPositionAndSizeForHorizontalLeftOneThird() {
            let expectedPosition = CGPoint(x: 0, y: 0)
            let expectedSize = CGSize(width: 1920 / 3, height: 1080)
            let result = DisplayCalculationManager.getWindowPositionAndSize(for: .HorizontalLeftOneThird)

            XCTAssertEqual(result?.positionCoordinates, expectedPosition, "The position for horizontal left one-third should be at the top-left corner.")
            XCTAssertEqual(result?.heightAndWidthCoordinates, expectedSize, "The size for horizontal left one-third should be one-third the width of the screen and full height.")
        }

        func testGetWindowPositionAndSizeForHorizontalRightTwoThird() {
            let expectedPosition = CGPoint(x: 640.0, y: 0)
            let expectedSize = CGSize(width: 1280.0, height: 1080)
            let result = DisplayCalculationManager.getWindowPositionAndSize(for: .HorizontalRightTwoThird)

            XCTAssertEqual(result?.positionCoordinates, expectedPosition, "The position for horizontal right two-thirds should be at two-thirds the width of the screen.")
            XCTAssertEqual(result?.heightAndWidthCoordinates, expectedSize, "The size for horizontal right two-thirds should be two-thirds the width of the screen and full height.")
        }
}
