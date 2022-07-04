//
//  SheetView.swift
//  ilanur
//
//  Created by Developer Light on 3.07.2022.
//

import SwiftUI

struct SheetView: View {
    var img: String
    var name: String
    var value: Date

    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: img)
                .font(.title2)
                .padding(5)

            VStack(alignment: .leading, spacing: 8) {
                Text(name)
                    .font(.footnote)
                Text(value, formatter: dateFormatter)
                    .font(.body)
                    .bold()
             }
         }
     } 
}



private let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .none
    dateFormatter.timeStyle = .short
    return dateFormatter
}()

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView(img: "", name: "", value: Date.now)
    }
}
