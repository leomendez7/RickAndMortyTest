//
//  RickAndMortyTestApp.swift
//  RickAndMortyTest
//
//  Created by Leonardo Mendez on 13/04/24.
//

import SwiftUI
import Presentation
import Domain

@main
struct RickAndMortyTestApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            CharactersView()
                .environmentObject(Store.storeDefault)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
   
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FontManager.registerFonts()
        return true
    }
    
}
