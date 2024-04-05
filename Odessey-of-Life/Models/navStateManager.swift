//
//  navStateManager.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 28/03/24.
//
import SwiftUI
import Foundation
import Combine

enum ColumnTypes: Int, Identifiable, Codable, CaseIterable{
    var id: Int {rawValue}
    
    case twoColumnLayout
    case threeColumnLayout
    
    var localizedName: LocalizedStringKey{
        switch self {
            case .twoColumnLayout:
                return "Two Column Layout"
            case .threeColumnLayout:
                return "Three Column Layout"
        }
    }
    
}
    
enum SelectionState: Hashable, Codable {
    case sidebarMenu1(menu1)
    case sidebarMenu2(menu2)
    case sidebarMenu3
}

class navStateManager: ObservableObject {
    
    @Published var selectionState: SelectionState? = nil
    @Published var selectedColumnLayout: ColumnTypes = .twoColumnLayout
    
    func popToRoot() {
        // selectionPath = []
    }
}
