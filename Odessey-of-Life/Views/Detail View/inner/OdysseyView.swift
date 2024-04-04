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
    
//    @State var textInput: String? = nil
    
    let passedVar : menu1
    
    var body: some View {
        NavigationStack {
            switch passedVar.menuNo {
                case 1:
                    TodayView()
                case 2:
                    AspectsView()
                case 3:
                    MemoriesView()
                default:
                    EmptyView()
                }
            
//            Text("hellll")
            
            #if os(iOS)
            TabView(selection: $selectedTab){
                DateView()
                    .tag(0)
                    .tabItem {
                        Label("Date", systemImage: "calendar")
                        Text("Tab 1", comment: "Tab bar title")
                    }
                
                ExclusiveView()
                    .tag(1)
                    .tabItem {
                        Label("Motivation", systemImage: "sparkles")
                        Text("Tab 1", comment: "Tab bar title")
                    }
                
            }
            #else
            
            #endif
        }
        
        
        
            
//            if navStateManager = SelectionState.sidebarMenu1(options.menuname)
            
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
