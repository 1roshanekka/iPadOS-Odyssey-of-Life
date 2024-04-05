//
//  OdysseyView.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 31/03/24.
//

/* view of common */
import SwiftUI

struct OdysseyView: View {
    
    @EnvironmentObject var navigationManager: navStateManager
    @EnvironmentObject var dataManager : ModelDataManager
    
    @State private var selectedTab = 0
    @State private var columnVisibility = NavigationSplitViewVisibility.all
    
//    @State var textInput: String? = nil
    
    let passedVar : menu1
    
    var body: some View {
        NavigationStack {
            switch passedVar.menuNo {
                case 1:
                NavigationSplitView(columnVisibility: $columnVisibility) {
                    if selectedTab == 0 {
                        DateView()
                            .toolbar(removing: .sidebarToggle)
                    } else {
                        ExclusiveView()
                            .toolbar(removing: .sidebarToggle)
                    }
                } detail: {
                    TodayView(selectedTab: $selectedTab)
                }
                .navigationSplitViewStyle(.balanced)
                
                case 2:
                    AspectsView()
                case 3:
                    MemoriesView()
                default:
                    EmptyView()
                }
            
        }
//        .onAppear(){
//            print(navigationManager)
//            print(dataManager)
//        }
        .navigationTitle("Your Life Today")
    }
}

#Preview {
    OdysseyView(passedVar: menu1Items[1])
}
