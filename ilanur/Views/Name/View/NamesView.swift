//
//  NamesView.swift
//  Adl
//
//  by Abdul Adl on 14.05.2022.
//

import SwiftUI

struct NamesView: View {
    @State private var showModal = true
    @State var vm = ViewModel()
    @State private var searchText = ""
    private var searchResult: [Asmaa] {
        let results = vm.filteredItems
        if searchText.isEmpty{ return results }
        return results.filter {
            $0.name.lowercased().contains(searchText.lowercased()) || $0.arabic.contains(searchText) || $0.shortText.lowercased().contains(searchText.lowercased())
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
//                    Okuduklarin kodlari...
                    
//                    Section(header: Text("Okudukların")) {
//                        ForEach(searchResult) { asma in
//                            if vm.contains(asma) {
//                                NavigationLink(destination:NameDetail(asma: asma)) {
//                                    NameCard(name: asma.name, arabic: asma.arabic, shortText: asma.shortText)
//                                }
//                            }
//                        }
//                    }
                    Section {
                        ForEach(searchResult) { asma in
                            NavigationLink(destination:NameDetail(asma: asma)) {
                                if vm.contains(asma) {
                                    NameCard(name: asma.name, arabic: asma.arabic, shortText: asma.shortText)
                                        .foregroundColor(Color.gray)
                                } else {
                                    NameCard(name: asma.name, arabic: asma.arabic, shortText: asma.shortText)
                                }
                            }
                        }
                    }
                }
                .searchable(text: $searchText)
                .listStyle(.insetGrouped)
            }
            .navigationTitle("Allah'ın isimleri")
        }
    }
}

struct NamesView_Previews: PreviewProvider {
    static var previews: some View {
        NamesView()
            .previewInterfaceOrientation(.portrait)
        
    }
}
