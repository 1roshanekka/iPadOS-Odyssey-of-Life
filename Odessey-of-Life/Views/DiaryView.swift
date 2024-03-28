//
//  DiaryView.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 28/03/24.
//

import SwiftUI

struct DiaryView: View {
    
    @EnvironmentObject var navigationManager: navStateManager
    
    var body: some View {
        
        if let state = navigationManager.selectionState {
            switch state {
            case .firstMenu(let appname):
                firstMenuView(appname1: "String")
            case .settings:
                settingsView()
            }
        } else {
            Text("Hello, World!, NOTHING SELECTED")
        }
        
    }
}

#Preview {
    DiaryView()
}
