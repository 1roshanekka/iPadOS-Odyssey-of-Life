//
//  menu2.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 31/03/24.
//

import Foundation

struct menu2: Identifiable, Hashable, Codable {
    var id = UUID()
    var menuNo: Int
    var tagName: String
    var iconName: String
    
    init(id: UUID = UUID(), menuNo: Int, tagName: String, iconName: String) {
        self.id = id
        self.menuNo = menuNo
        self.tagName = tagName
        self.iconName = iconName
    }
}

let menu2Items: [menu2] = [
    menu2(menuNo: 1, tagName: "Red", iconName: "circle.fill"),
    menu2(menuNo: 2, tagName: "Blue", iconName: "circle.fill"),
    menu2(menuNo: 3, tagName: "Green", iconName: "circle.fill")
]
