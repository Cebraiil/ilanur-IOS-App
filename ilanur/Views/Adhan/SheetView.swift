//
//  SheetView.swift
//  ilanur
//
//  Created by Developer Light on 3.07.2022.
//

import SwiftUI

struct SheetView: View {
    var name: String
    var value: Date

    var body: some View {
        VStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 8) {
                Text(name)
                    .font(.body)
                Text(value, formatter: dateFormatter)
                    .font(.title)
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
        SheetView(name: "", value: Date.now)
    }
}
