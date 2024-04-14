//
//  Default.swift
//
//
//  Created by Leonardo Mendez on 14/04/24.
//

import Foundation

public class Default: ObservableObject {
    
    public enum Key: String {
        case character
    }
    
    public static func destroySession(){
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: Key.character.rawValue)
    }
    
    public init() { }

}
