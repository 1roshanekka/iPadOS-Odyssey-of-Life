//
//  navStateManager.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 28/03/24.
//

import Foundation
import Combine

enum SelectionState: Hashable, Codable {
    case firstMenu(appname)
    case settings
}

class navStateManager: ObservableObject {
    
    @Published var selectionState: SelectionState? = nil
    
    func popToRoot() {
        // selectionPath = []
    }
}
