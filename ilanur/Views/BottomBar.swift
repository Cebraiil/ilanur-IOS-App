//
//  BottomBar.swift
//  ilanur
//
//  by Developer Light on 1.07.2022.
//

import SwiftUI

struct BottomBar: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        TabView {
            NamesView()
                .tabItem {
                    Image(systemName: "book.closed")
                        .padding(.top)
            }
            AdhanView()
                .tabItem {
                    Image(systemName: "timer")
            }
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
            }
        }  
        .accentColor(Color("mycolor"))
    }
}

struct BottomBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomBar()
    }
}
