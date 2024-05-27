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
    case upArrow = 126
    case bottomArrow = 125
    
    static let commandKey = "\u{2318}"
    static let optionKey = "\u{2325}"
    static let controlKey = "\u{2303}"
    
    var shortcutText: String {
        switch self {
        case .leftArrow:
            return "Left half: \(HandledKeyCodes.controlKey) + \(HandledKeyCodes.optionKey) + \(HandledKeyCodes.commandKey) + \u{25C0}"
        case .rightArrow:
            return "Right half: \(HandledKeyCodes.controlKey) + \(HandledKeyCodes.optionKey) + \(HandledKeyCodes.commandKey) + \u{25B6}"
        case .upArrow:
            return "Top half: \(HandledKeyCodes.controlKey) + \(HandledKeyCodes.optionKey) + \(HandledKeyCodes.commandKey) + \u{25B2}"
        case .bottomArrow:
            return "Bottom half: \(HandledKeyCodes.controlKey) + \(HandledKeyCodes.optionKey) + \(HandledKeyCodes.commandKey) + \u{25BC}"
        }
    }
}
