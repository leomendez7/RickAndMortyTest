//
//  Logs.swift
//  
//
//  Created by Leonardo Mendez on 13/04/24.
//

import Foundation
import SwiftyBeaver

public typealias AppLogger = SwiftyBeaver

public struct Logs {
    
    private static let log = SwiftyBeaver.self
    
    private init() { }
    
    // MARK: - Configuration
    
    public static func log(level: SwiftyBeaver.Level = .debug, message: @autoclosure () -> Any, file: String = #file,
                           function: String = #function, line: Int = #line, context: Any? = nil) {
        log.custom(level: level, message: message(), file: file, function: function, line: line, context: context)
    }
}

extension SwiftyBeaver {
    public static var fileHTTPResponses: Bool = true
    public static var logAccessibilityIdentifiers: Bool = false
    public static var fileURL: URL?
    
    public static func configure(shouldLogInConsole: Bool = true) {
        if shouldLogInConsole {
            addConsoleDestination()
        }
    }
    
    static func addConsoleDestination() {
        guard !destinations.contains(where: { $0 is ConsoleDestination }) else { return }
        let destination = ConsoleDestination()
        destination.format = "$DHH:mm:ss$d $C [$N:$l] $M$c"
        destination.minLevel = .debug
        destination.setDefaultIndicators()
        addDestination(destination)
    }
}

extension ConsoleDestination {
    func setDefaultIndicators() {
        levelColor.verbose = "💬"
        levelColor.debug = "🗒"
        levelColor.info = "ℹ️"
        levelColor.warning = "⚠️"
        levelColor.error = "❌"
    }
}
