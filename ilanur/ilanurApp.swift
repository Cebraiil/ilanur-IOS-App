//
//  ilanurApp.swift
//  ilanur
//
//  by Developer Light on 1.07.2022.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var hasOnboarded: Bool
    
    init(hasOnboarded: Bool) {
        self.hasOnboarded = hasOnboarded
    }
}


@main
struct ilanurApp: App {
    @ObservedObject var appstate = AppState(hasOnboarded: false)
    var body: some Scene {
        WindowGroup {
            if UserDefaults.standard.welcomeScreenShown {
                SplashScreenView()
            } else {
                if appstate.hasOnboarded {
                    SplashScreenView()
                        .environmentObject(appstate)
                } else {
                    WelcomeView()
                        .environmentObject(appstate)
                }
            }
        }
    }
}
