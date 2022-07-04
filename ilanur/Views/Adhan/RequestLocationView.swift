//
//  RequestLocationView.swift
//  ilanur
//
//  by Developer Light on 2.07.2022.
//

import SwiftUI
import CoreLocationUI

struct RequestLocationView: View {
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Image(systemName: "map.fill")
                    .font(.system(size: 100))
                 Text("Ezan Saatleri")
                    .bold()
                    .font(.title)
                
                Text("Güncel konumunuza göre Ezan Saatlerinizi güncellemesini istiyorsanız Konum servislerine izin veriniz")
                    .font(.footnote)
                    .padding()
            }
            .padding()
            .multilineTextAlignment(.center)
            Button(action: {
                LocationManager.shared.requestLocation()
            }, label: {
                Text("Konum Servislerini Etkinleştir")
            })
            .padding(12)
            .background(Color(UIColor.opaqueSeparator))
            .foregroundColor(Color("Color"))
            .cornerRadius(5)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct RequestLocationView_Previews: PreviewProvider {
    static var previews: some View {
        RequestLocationView()
    }
}
