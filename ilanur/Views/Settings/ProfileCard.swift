//
//  ProfileCard.swift
//  ilanur
//
//  by Developer Light on 22.06.2022.
//

import SwiftUI

struct ProfileCard: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack(spacing: 15) {
            Image(colorScheme == .dark ? "logo-dark" : "logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .frame(maxWidth: 60)
            VStack {
                Text("ILA NUR")
                    .font(.title2)
                    .bold()
                Text("@ilanur.turkish")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        }
        .frame(maxWidth:.infinity, alignment: .center)
        .padding()
    }
}

struct ProfileCard_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCard()
    }
}
