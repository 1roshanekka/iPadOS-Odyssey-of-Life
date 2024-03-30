//
//  menu1.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 31/03/24.
//

import Foundation

struct menu1: Identifiable, Hashable, Codable {
    var id = UUID()
    var menuName: String
    var iconName: String
    
    init(id: UUID = UUID(), menuName: String, iconName: String) {
        self.id = id
        self.menuName = menuName
        self.iconName = iconName
    }
    
    static func examples() -> [menu1] {
        [menu1(menuName: "Your Life Today", iconName: "heart.fill"),
         menu1(menuName: "Aspects", iconName: "swirl.circle.righthalf.filled.inverse"),
         menu1(menuName: "Memories", iconName: "heart.fill")]
    }
    
    
}

let menu1Items: [menu1] = [
    menu1(menuName: "Pizza Margherita", iconName: "heart.fill"),
    menu1(menuName: "Spaghetti Bolognese", iconName: "heart.fill"),
    menu1(menuName: "Lasagna", iconName: "heart.fill")
]
