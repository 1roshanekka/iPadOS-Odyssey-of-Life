//
//  menu2.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 31/03/24.
//

import Foundation


struct menu2: Identifiable, Hashable, Codable {
    var id = UUID()
    var tagName: String
    var iconName: String
    
    init(id: UUID = UUID(), tagName: String, iconName: String) {
        self.id = id
        self.tagName = tagName
        self.iconName = iconName
    }
    
    static func examples() -> [menu2] {
        [menu2(tagName: "Red", iconName: "red.fill"),
         menu2(tagName: "Blue", iconName: "swirl.circle.righthalf.filled.inverse"),
         menu2(tagName: "Green", iconName: "heart.fill")]
    }
    
    
}

let menu2Items: [menu2] = [
    menu2(tagName: "Pizza Margherita", iconName: "heart.fill"),
    menu2(tagName: "Spaghetti Bolognese", iconName: "heart.fill"),
    menu2(tagName: "Lasagna", iconName: "heart.fill")
]
