//
//  existing.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 31/03/24.
//

import Foundation


struct existing: Identifiable, Hashable, Codable {
    var title: String
    let id: UUID
    
    init(title: String) {
        self.title = title
        self.id = UUID()
    }
    
    static func examples() -> [existing] {
        [existing(title: "Titanic"),
         existing(title: "Avatar"),
         existing(title: "Lord of the Ring")]
    }
    
}
