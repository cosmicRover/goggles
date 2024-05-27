//
//  DisplayCalculationManager.swift
//  goggles
//
//  Created by Joy Paul on 5/24/24.
//

import Cocoa
import os.log

struct DisplayCalculationManager {
    static func getWindowPositionAndSize(for position: ResizePosition) -> WindowPositionAndSize?{
        let topLeftOrigin = getWindowPositionOrigin(for: .horizontaLeft, displayCalcualtorFunc: getCurrentDisplaySize)
        let horizontalHeightAndWidth = getWindowSize(for: .horizontaLeft, displayCalcualtorFunc: getCurrentDisplaySize)
        
        switch position {
        case .horizontaLeft:
            return WindowPositionAndSize(positionCoordinates: topLeftOrigin ?? CGPoint.zero, heightAndWidthCoordinates: horizontalHeightAndWidth ?? CGSize.zero)
        case .horizontalRight:
            return WindowPositionAndSize(positionCoordinates: getWindowPositionOrigin(for: .horizontalRight, displayCalcualtorFunc: getCurrentDisplaySize) ?? CGPoint.zero, heightAndWidthCoordinates: horizontalHeightAndWidth ?? CGSize.zero)
        case .verticalTop:
            return nil
        case .verticalBottom:
            return nil
        }
    }
    
    private static func getCurrentDisplaySize() -> CGSize {
        guard let screenSize = NSScreen.main?.frame.size else {
            os_log("Unable to retrieve display size", log: OSLog.application, type: .error)
            return CGSize.zero
        }
        
        return screenSize
    }
    
    private static func getWindowPositionOrigin(for position: ResizePosition, displayCalcualtorFunc: ()-> CGSize) -> CGPoint? {
        let currentDisplaySize = displayCalcualtorFunc()
        
        switch position {
        case .horizontaLeft:
            return CGPoint(x: 0, y: 0)
        case .horizontalRight:
            return CGPoint(x: currentDisplaySize.width/2, y: 0)
        case .verticalTop:
            return nil
        case .verticalBottom:
            return nil
        }
    }
    
    private static func getWindowSize(for position: ResizePosition, displayCalcualtorFunc: ()-> CGSize) -> CGSize? {
        let currentDisplaySize = displayCalcualtorFunc()
        
        switch position{
        case .horizontaLeft, .horizontalRight:
            return CGSize(width: currentDisplaySize.width/2, height: currentDisplaySize.height)
        case .verticalTop, .verticalBottom:
            return nil
        }
    }
}
