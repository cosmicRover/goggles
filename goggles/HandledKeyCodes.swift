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
    
    var shortcutText: String {
        switch self {
        case .leftArrow:
            return "Left half: \u{2318} + \u{2325} + \u{25C0}"
        case .rightArrow:
            return "Right half: \u{2318} + \u{2325} + \u{25B6}"
        }
    }
}
