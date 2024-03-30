//
//  navStateManager.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 28/03/24.
//

import Foundation
import Combine

enum SelectionState: Hashable, Codable {
    case sidebarMenu1(menu1)
    case sidebarMenu2(menu2)
    case sidebarMenu3
}

class navStateManager: ObservableObject {
    
    @Published var selectionState: SelectionState? = nil
    
    func popToRoot() {
        // selectionPath = []
    }
}
