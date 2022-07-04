//
//  TitleView.swift
//  ilanur
//
//  Created by Developer Light on 23.06.2022.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        VStack {
            Text("İlanur")
                .customTitleText()
            Text("iOS’a Hoş geldiniz!")
                .customTitleText()
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
