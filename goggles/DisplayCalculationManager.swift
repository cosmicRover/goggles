//
//  DisplayCalculationManager.swift
//  goggles
//
//  Created by Joy Paul on 5/24/24.
//

import Cocoa

struct DisplayCalculationManager {
    private func getCurrentDisplaySize() -> CGSize {
        guard let screenSize = NSScreen.main?.frame.size else {
            print("Unable to retrieve screen size.")
            return CGSize.zero
        }
        
        return screenSize
    }
    
    private func getPositionOrigin(for position: ResizePosition) -> CGPoint? {
        let currentDisplaySize = getCurrentDisplaySize()
        let height = currentDisplaySize.height
        let width = currentDisplaySize.width
        
        switch position {
        case .horizontaLeft:
            return CGPoint(x: 0, y: 0)
        case .horizontalRight:
            return CGPoint(x: (height/2)+1, y: 0)
        case .verticalTop:
            return nil
        case .verticalBottom:
            return nil
        }
    }
    
    //TODO: add code for incorporating width and the total display calcualtion and then expose to public
}
