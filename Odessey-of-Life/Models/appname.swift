//
//  appname.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 28/03/24.
//

import Foundation

struct appname: Identifiable, Hashable, Codable {
    var id = UUID()
    var menuName: String
    var iconName: String
    
    init(id: UUID = UUID(), menuName: String, iconName: String) {
        self.id = id
        self.menuName = menuName
        self.iconName = iconName
    }
    
    static func examples() -> [appname] {
        [appname(menuName: "Your Life Today", iconName: "heart.fill"),
        appname(menuName: "Aspects", iconName: "swirl.circle.righthalf.filled.inverse"),
        appname(menuName: "Memories", iconName: "heart.fill")]
    }
    
    
}

let menuItems: [appname] = [
  appname(menuName: "Pizza Margherita", iconName: "heart.fill"),
  appname(menuName: "Spaghetti Bolognese", iconName: "heart.fill"),
  appname(menuName: "Lasagna", iconName: "heart.fill")
]
