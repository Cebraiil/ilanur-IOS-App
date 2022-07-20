//
//  Database.swift
//  ilanur
//
//  Created by Developer Light on 20.07.2022.
//

import Foundation

final class Database {
    private let FAV_KEY = "fav_key"
    
    func save(Names: Set<Int>) {
        let array = Array(Names)
        UserDefaults.standard.set(array, forKey: FAV_KEY)
    }
    
    func load() -> Set<Int> {
        let array = UserDefaults.standard.array(forKey: FAV_KEY) as? [Int] ?? [Int]()
        return Set(array)
    }
}
