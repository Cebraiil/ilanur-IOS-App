//
//  ButtonModifier.swift
//  ilanur
//
//  by Developer Light on 23.06.2022.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color("WbtnText"))
            .buttonBorderShape(.automatic)
            .controlSize(.large)
            .padding()
            .padding(.horizontal)
            .background(Color("welcomeScreen"))
            .cornerRadius(7)
    }
}

extension View {
    func customButton() -> ModifiedContent<Self, ButtonModifier> {
        return modifier(ButtonModifier())
    }
}

extension Text {
    func customTitleText() -> Text {
        self
            .fontWeight(.black)
            .font(.title)
    }
}

extension Color {
    static var mainColor = Color("welcomeScreen")
}
