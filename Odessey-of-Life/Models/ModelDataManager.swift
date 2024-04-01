//
//  ModelDataManager.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 28/03/24.
//

import Foundation

class ModelDataManager: ObservableObject {
    
    @Published var sidebarMenu1 = menu1Items
    @Published var sidebarMenu2 = menu2Items
    @Published var sidebarMenu3 = settingsView()
    
}
