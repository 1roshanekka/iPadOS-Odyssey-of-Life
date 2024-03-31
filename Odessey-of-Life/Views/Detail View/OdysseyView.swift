//
//  OdysseyView.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 31/03/24.
//

import SwiftUI

struct OdysseyView: View {
    
    @EnvironmentObject var navigationManager: navStateManager
    @EnvironmentObject var dataManager : ModelDataManager
    
    let passedVar : menu1
    var body: some View {
        VStack {
            Text("hello view")
            Text("this is odyssey of life")
        }
        .navigationTitle("Odyssey of Life")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    //add to best memories
                } label: {
                    Image(systemName: "heart")
                }
            }
        }
    }
}

//
//#Preview {
//    OdysseyView()
//}
