//
//  NameDetail.swift
//  Adl
//
//  Created by Abdul Adl on 20.05.2022.
//

import SwiftUI

struct NameDetail: View {
    let asma: Asmaa
    @StateObject private var vm = ViewModel()
    var body: some View {
        ScrollView {
            VStack {
                HStack(spacing: 20) {
                    VStack(alignment: .leading) {
                        Text(asma.name)
                    }
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .font(.footnote)
                    Button(action: actionSheet) {
                           Image(systemName: "square.and.arrow.up")
                    }
                    Image(systemName: vm.contains(asma) ? "circle.fill" : "circle")
                        .onTapGesture {
                            vm.toggleFav(item: asma)
                        }
                    }
                VStack {
                    Divider()
                }
                VStack(alignment: .trailing) {
                    Text(asma.arabic)
                        .font(.custom(
                            "NotoKufiArabic-Medium",
                            size:.minimum(50, 60)))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(.top)
                        .foregroundColor(Color.gray)

                }
                .frame(maxWidth:.infinity, alignment: .center)
                VStack(alignment: .leading, spacing: 10) {
                    VStack(alignment: .center) {
                        Text(asma.shortText)
                            .font(.title)
                    }
                    .frame(maxWidth:.infinity, alignment: .center)
                    VStack {
                        Divider()
                    }
                }
            }
            .frame(maxWidth:.infinity, maxHeight: .infinity,alignment: .topLeading)
            .padding()
        }
    }
    func actionSheet() {
        let description = asma.arabic + "\n" + asma.name + " : " + asma.shortText
        let activityVC = UIActivityViewController(activityItems: [description], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }
}

struct NameDetail_Previews: PreviewProvider {
    static var previews: some View {
        NameDetail(asma: Asmaa(isFaved:false ,id: 0,name: "", arabic: "", shortText: "", description: ""))
    }
}
