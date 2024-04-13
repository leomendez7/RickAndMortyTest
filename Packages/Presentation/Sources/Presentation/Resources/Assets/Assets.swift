//
//  Assets.swift
//  
//
//  Created by Leonardo Mendez on 13/04/24.
//

import SwiftUI

public enum Assets {

    public enum Icons: String {
        case blackArrowLeft
    }
    
}

extension Image {
    
    public init(fromIconAssets name: Assets.Icons) {
        self.init(name.rawValue, bundle: .module)
    }
    
    public init(mockPodcast mock: String) {
        self.init(mock, bundle: .module)
    }
    
}
