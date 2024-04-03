//
//  TagView.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 31/03/24.
//

import SwiftUI

struct TagView: View {
    
    @EnvironmentObject var navigationManager: navStateManager
    @EnvironmentObject var dataManager : ModelDataManager
    
    let passedVar : menu2
    
    var body: some View {
        Text("Colors !")
    }
}

#Preview {
    TagView(passedVar: menu2Items[0])
}
