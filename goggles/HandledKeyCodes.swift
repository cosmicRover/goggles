//
//  HandledKeyCodes.swift
//  goggles
//
//  Created by Joy Paul on 5/24/24.
//

import Foundation
import SwiftUI

enum HandledKeyCodes: UInt16, CaseIterable {
    case leftArrow = 123
    case rightArrow = 124
    
    static let commandKey = "\u{2318}"
    static let optionKey = "\u{2325}"
    
    var shortcutText: String {
        switch self {
        case .leftArrow:
            return "Left half: \(HandledKeyCodes.optionKey) + \(HandledKeyCodes.commandKey) + \u{25C0}"
        case .rightArrow:
            return "Right half: \(HandledKeyCodes.optionKey) + \(HandledKeyCodes.commandKey) + \u{25B6}"
        }
    }
}
