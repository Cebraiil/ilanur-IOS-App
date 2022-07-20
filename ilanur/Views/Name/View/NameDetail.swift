//
//  NameDetail.swift
//  Adl
//
//  by Abdul Adl on 20.05.2022.
//

import SwiftUI

struct NameDetail: View {
    @State var asma: Asmaa
    var body: some View {
        ScrollView {
            VStack {
                HStack(spacing: 20) {
                    VStack(alignment: .leading) {
                        Text(asma.name)
                    }
                    Spacer()
                    .font(.footnote)
                    Image(systemName: asma.isFaved ? "circle.fill" : "circle")
                        .onTapGesture {
                            asma.isFaved.toggle()
                        }
                    Button(action: actionSheet) {
                           Image(systemName: "square.and.arrow.up")
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
                        .fontWeight(.bold)
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
