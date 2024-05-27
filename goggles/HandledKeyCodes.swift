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
    case keyF = 3
    case keyA = 0
    case keyS = 1
    case keyApostrophe = 39
    case keySemicolon = 41
    
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
        case .keyF:
            return "Fullscreen: \(HandledKeyCodes.controlKey) + \(HandledKeyCodes.optionKey) + \(HandledKeyCodes.commandKey) + F"
        case .keyA:
            return "Left 1/3: \(HandledKeyCodes.controlKey) + \(HandledKeyCodes.optionKey) + \(HandledKeyCodes.commandKey) + A"
        case .keyS:
            return "Left 2/3: \(HandledKeyCodes.controlKey) + \(HandledKeyCodes.optionKey) + \(HandledKeyCodes.commandKey) + S"
        case .keyApostrophe:
            return "Right 1/3: \(HandledKeyCodes.controlKey) + \(HandledKeyCodes.optionKey) + \(HandledKeyCodes.commandKey) + '"
        case .keySemicolon:
            return "Right 2/3: \(HandledKeyCodes.controlKey) + \(HandledKeyCodes.optionKey) + \(HandledKeyCodes.commandKey) + ;"
        }
    }
}
