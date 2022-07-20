//
//  FavFunc.swift
//  Adl

import Foundation
import SwiftUI

extension NamesView {
    final class ViewModel: ObservableObject {
        @Published var Names = [Asmaa]()
        @Published var showingFavs = false
        @Published var savedItems: Set<Int> = [1, 7]
        
        // Filter saved items
        var filteredItems: [Asmaa]  {
            if showingFavs {
                return Names.filter { savedItems.contains($0.id) }
            }
            return Names
        }
        
        private var db = Database()
        
        init() {
            self.savedItems = db.load()
            self.Names = Asmaa.Name
        }
        
        func sortFavs() {
            withAnimation() {
                showingFavs.toggle()
            }
        }
        
        func contains(_ item: Asmaa) -> Bool {
                savedItems.contains(item.id)
            }
        
        // Toggle saved items
        func toggleFav(name: Asmaa) {
            if contains(name) {
                savedItems.remove(name.id)
            } else {
                savedItems.insert(name.id)
            }
            db.save(Names: savedItems)
        }
    }
}
