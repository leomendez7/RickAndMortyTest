//
//  Font.swift
//
//
//  Created by Leonardo Mendez on 13/04/24.
//

import SwiftUI

public enum FontError: Swift.Error {
   case failedToRegisterFont
}

public enum FontManager: String, CaseIterable {
   
    case black = "CircularStd-Black"
    case blackItalic = "CircularStd-BlackItalic"
    case bold = "CircularStd-Bold"
    case boldItalic = "CircularStd-BoldItalic"
    case book = "CircularStd-Book"
    case bookItalic = "CircularStd-BookItalic"
    case medium = "CircularStd-Medium"
    case mediumItalic = "CircularStd-MediumItalic"
    
    public static func registerFonts() {
        do {
            try allCases.forEach {
                try registerFont(name: $0.rawValue)
            }
        } catch {
            print("Couldn't register fonts")
        }
    }
    
    private static func registerFont(name: String) throws {
        guard
            let asset = NSDataAsset(name: "Fonts/\(name)", bundle: Bundle.module),
            let provider = CGDataProvider(data: asset.data as NSData),
            let font = CGFont(provider),
            CTFontManagerRegisterGraphicsFont(font, nil)
        else {
            throw FontError.failedToRegisterFont
        }
    }
}

extension View {
    
    public func typography(custom font: FontManager, size: CGFloat) -> some View {
        self
            .font(.custom(font.rawValue, size: size))
    }
    
    public func foregroundColor(fromAssets color: Colors) -> some View {
        self.foregroundColor(Color(named: color))
    }
    
}
