//
//  WelcomeView.swift
//  ilanur
//
//  by Developer Light on 1.07.2022.
//

import SwiftUI
import CoreLocationUI

extension UserDefaults {
    var welcomeScreenShown: Bool {
        get {
            return (UserDefaults.standard.value(forKey: "welcomescreen") as? Bool) ?? false
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "welcomescreen")
        }
    }
}

struct WelcomeView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var appState: AppState
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                TitleView()
                Spacer()
                InformationContainerView()
                Spacer()
                Button(action: {
                       UserDefaults.standard.welcomeScreenShown = true
                       appState.hasOnboarded = true
                }) {
                   Text("Öğrenmeye başla!")
                       .customButton()
                       .font(.body)
                }
                .padding()
                .padding(.bottom)
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
