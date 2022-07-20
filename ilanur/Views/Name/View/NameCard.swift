
import SwiftUI

struct NameCard: View {
    
    var name: String
    var arabic: String
    var shortText: String
    var isSaved: Bool = false
    var model: Asmaa
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                VStack (alignment: .leading){
                    Text(name)
                        .font(.subheadline).bold()
                    Text(shortText)
                        .font(.caption)
                        .opacity(0.7)
                }
                .frame(maxWidth:.infinity, alignment: .leading)
                HStack {
                    Text(arabic)
                        .font(.custom(
                            "NotoKufiArabic-Medium",
                            size:.minimum(20, 20)))
                        .fontWeight(.bold)
                    Image(systemName: isSaved ? "heart.fill" : "heart")
                        .onTapGesture {
                            
                        }
                }
                .padding(.leading)
            }
        }
    }
}

//struct NameCard_Previews: PreviewProvider {
//    static var previews: some View {
//        NameCard(name: "", arabic: "", shortText: "")
//    }
//}
