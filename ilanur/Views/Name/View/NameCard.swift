
import SwiftUI

struct NameCard: View {
    var name: String
    var arabic: String
    var shortText: String
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .trailing) {
                    VStack (alignment: .leading){
                        Text(name)
                            .font(.subheadline).bold()
                        Text(shortText)
                            .font(.caption)
                            .opacity(0.7)
                    }
                    .frame(maxWidth:.infinity, alignment: .leading)
                }
                VStack(alignment: .trailing) {
                    Text(arabic)
                        .font(.custom(
                            "NotoKufiArabic-Medium",
                            size:.minimum(20, 20)))
                        .fontWeight(.bold)
                }
                .padding(.leading)
            }
        }
    }
}

struct NameCard_Previews: PreviewProvider {
    static var previews: some View {
        NameCard(name: "", arabic: "", shortText: "")
    }
}
