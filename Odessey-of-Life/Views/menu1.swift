//
//  menu1.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 31/03/24.
//

import Foundation


struct menu1: Identifiable, Hashable, Codable {
    var id = UUID()
    var menuNo: Int
    var menuName: String
    var iconName: String
    var style: String
    
    init(id: UUID = UUID(), menuNo: Int, menuName: String, iconName: String, style: String) {
        self.id = id
        self.menuNo = menuNo
        self.menuName = menuName
        self.iconName = iconName
        self.style = style
    }
    
}



let menu1Items: [menu1] = [
    menu1(menuNo: 1, menuName: "Your Life Today", iconName: "heart.fill", style: ".red"),
    menu1(menuNo: 2, menuName: "Aspects", iconName: "swirl.circle.righthalf.filled.inverse", style: ".blue"),
    menu1(menuNo: 3, menuName: "Memories", iconName: "brain.filled.head.profile", style: ".blue")
]
