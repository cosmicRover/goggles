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
        let currentDisplaySize = getCurrentDisplaySize()
        
        let topLeftOrigin = getWindowPositionOrigin(for: .horizontaLeft, currentDisplaySize: currentDisplaySize)
        let horizontalHeightAndWidth = getWindowSize(for: .horizontaLeft, currentDisplaySize: currentDisplaySize)
        let verticalHeightAndWidth = getWindowSize(for: .verticalTop, currentDisplaySize: currentDisplaySize)
        
        switch position {
        case .horizontaLeft:
            return WindowPositionAndSize(positionCoordinates: topLeftOrigin, heightAndWidthCoordinates: horizontalHeightAndWidth)
        case .horizontalRight:
            return WindowPositionAndSize(positionCoordinates: getWindowPositionOrigin(for: .horizontalRight, currentDisplaySize: currentDisplaySize), heightAndWidthCoordinates: horizontalHeightAndWidth)
        case .verticalTop:
            return WindowPositionAndSize(positionCoordinates: getWindowPositionOrigin(for: .verticalTop, currentDisplaySize: currentDisplaySize), heightAndWidthCoordinates: verticalHeightAndWidth)
        case .verticalBottom:
            return WindowPositionAndSize(positionCoordinates: getWindowPositionOrigin(for: .verticalBottom, currentDisplaySize: currentDisplaySize), heightAndWidthCoordinates: verticalHeightAndWidth)
        }
    }
    
    private static func getCurrentDisplaySize() -> CGSize {
        guard let displaySize = NSScreen.main?.frame.size else {
            os_log("Unable to retrieve display size", log: OSLog.application, type: .error)
            return CGSize.zero
        }
        
        os_log("Current display size is: %@", log: OSLog.application, type: .info, displaySize as CVarArg)
        
        return displaySize
    }
    
    private static func getWindowPositionOrigin(for position: ResizePosition, currentDisplaySize: CGSize) -> CGPoint {
        switch position {
        case .horizontaLeft, .verticalTop:
            return CGPoint(x: 0, y: 0)
        case .horizontalRight:
            return CGPoint(x: currentDisplaySize.width/2, y: 0)
        case .verticalBottom:
            return CGPoint(x: 0, y: currentDisplaySize.height/2)
        }
    }
    
    private static func getWindowSize(for position: ResizePosition, currentDisplaySize: CGSize) -> CGSize {
        switch position{
        case .horizontaLeft, .horizontalRight:
            return CGSize(width: currentDisplaySize.width/2, height: currentDisplaySize.height)
        case .verticalTop, .verticalBottom:
            return CGSize(width: currentDisplaySize.width, height: currentDisplaySize.height/2)
        }
    }
}
