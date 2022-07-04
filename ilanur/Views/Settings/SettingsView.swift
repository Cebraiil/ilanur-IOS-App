//
//  SettingsView.swift
//  ilanur
//
//  by Developer Light on 21.06.2022.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.openURL) var openURL
    @Environment(\.colorScheme) var colorScheme: ColorScheme

    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section {
                        ProfileCard()
                    }
                    Section(header: Text("Sosyal medya")) {
                        VStack {
                            Link(destination: URL(string: "https://www.youtube.com/c/ilanour")!) {
                                HStack {
                                    Image(systemName: "play.rectangle.fill")
                                    Text("YouTube")
                                    Spacer()
                                    Image(systemName: "link")
                                }
                            }
                       }
                        VStack {
                            Link(destination: URL(string: "https://www.instagram.com/ilanur.turkish/")!) {
                                HStack {
                                    Image(colorScheme == .dark ? "instagram-dark" : "instagram" )
                                    Text("Instagram")
                                    Spacer()
                                    Image(systemName: "link")
                                }
                            }
                       }
                        VStack {
                            Link(destination: URL(string: "https://www.tiktok.com/@ilanur.turkish")!) {
                                HStack {
                                    Image(colorScheme == .dark ? "tiktok-dark" : "tiktok")
                                    Text("TikTok")
                                    Spacer()
                                    Image(systemName: "link")
                                }
                            }
                       }
                    }
                }
                .listStyle(.insetGrouped)
            }
            .navigationTitle("Ayarlar")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
