//
//  NamesView.swift
//  Adl
//
//  by Abdul Adl on 14.05.2022.
//

import SwiftUI

struct NamesView: View {
    
    @State private var showModal = true
    @State private var searchText = ""
    @StateObject var viewModel = ViewModel()

    private var searchResult: [Asmaa] {
        let results = viewModel.filteredItems
        if searchText.isEmpty{ return results }
        return results.filter {
            $0.name.lowercased().contains(searchText.lowercased()) || $0.arabic.lowercased().contains(searchText) || $0.shortText.lowercased().contains(searchText.lowercased())
        }
    }

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
//                Button {
//                    withAnimation {
//                        viewModel.showingFavs.toggle()
//                    }
//                } label: {
//                    Text("Okuduklarını göster")
//                        .foregroundColor(Color(.systemBlue))
//                }
//                .padding(.leading, 30)
                List {
                    ForEach(searchResult) { asma in
                        NavigationLink(destination:NameDetail(asma: asma)) {
                            HStack(alignment: .center) {
                                VStack (alignment: .leading){
                                    Text(asma.name)
                                        .font(.subheadline).bold()
                                    Text(asma.shortText)
                                        .font(.caption)
                                        .opacity(0.7)
                                }
                                .frame(maxWidth:.infinity, alignment: .leading)
                                HStack {
                                    Text(asma.arabic)
                                        .font(.custom(
                                            "NotoKufiArabic-Medium",
                                            size:.minimum(20, 20)))
                                        .fontWeight(.bold)
                                    Image(systemName: viewModel.contains(asma) ?  "circle.fill" : "circle")
                                        .onTapGesture {
                                            viewModel.toggleFav(name: asma)
                                        }
                                }
                            }
                        }
                    }
                }
                .listStyle(.insetGrouped)
            }
            .searchable(text: $searchText)
            .navigationTitle("ESMAÜL HÜSNA")
        }
    }
}

struct NamesView_Previews: PreviewProvider {
    static var previews: some View {
        NamesView()        
    }
}
