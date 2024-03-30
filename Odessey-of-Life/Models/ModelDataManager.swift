//
//  ModelDataManager.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 28/03/24.
//

import Foundation

class ModelDataManager: ObservableObject {
    
    @Published var sidebarMenu1 = menu1.examples()
    @Published var sidebarMenu2 = menu2.examples()
    @Published var sidebarMenu3 = settingsView()
    
}
