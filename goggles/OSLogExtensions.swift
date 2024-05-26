//
//  OSLogExtensions.swift
//  goggles
//
//  Created by Joy Paul on 5/26/24.
//

import os.log
import Foundation

extension OSLog {
    static let application = OSLog(subsystem: Bundle.main.bundleIdentifier ?? "identifier.not.set", category: "application")
}
