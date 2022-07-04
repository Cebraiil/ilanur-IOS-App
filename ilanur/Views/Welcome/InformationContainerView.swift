//
//  InformationContainerView.swift
//  ilanur
//
//  Created by Developer Light on 23.06.2022.
//

import SwiftUI

struct InformationContainerView: View {
    var body: some View {
        VStack(alignment: .leading) {
            InformationDetailView(title: "Allah'ın isimleri", subTitle: "Allah’ın 99 ismi vardır. Yüzden bir eksik. Bu isimleri bir kimse ezberlerse (hıfz) Cennet’e girer. O tektir, teki sever.", imageName: "book.closed")
            InformationDetailView(title: "Kur'an-ı Kerim", subTitle: "Muhakkak ki bu Kur´an; en doğru olana götürür. Ve salih amel işleyen mü´ minlere kendileri için büyük bir mükafat olduğunu müjdeler.", imageName: "book.fill")
            InformationDetailView(title: "Ezan Vakti", subTitle: "Ezan saatinizi doğru bir şekilde hesaplamamız için güncel konumunuza erişmemiz gerekecektir.", imageName: "timer")
        }
        .padding(.horizontal)
    }
}

struct InformationContainerView_Previews: PreviewProvider {
    static var previews: some View {
        InformationContainerView()
    }
}
