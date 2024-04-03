//
//  SideBarView.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 25/03/24.
//

import SwiftUI

struct SideBarView: View {
    
    @EnvironmentObject var dataManager : ModelDataManager
    @EnvironmentObject var navigationManager : navStateManager
        
    var body: some View {
        List(selection: $navigationManager.selectionState){
            
            Section(header: Text("Odyssey of Life")){
                    ForEach(dataManager.sidebarMenu1) { options in
//                        NavigationLink(options.menuName, value: SelectionState.sidebarMenu1(options))
//                            .onAppear()
//                            {
//                                print(options)
//                            }
                        NavigationLink(value: SelectionState.sidebarMenu1(options)) {
                            HStack {
                                Image(systemName: options.iconName)
                                    .foregroundColor(Color(options.style))
                                Text(options.menuName)
                            }
                        }
                    }
                    
            }
            
            Section(header: Text("Tags")){
                ForEach(dataManager.sidebarMenu2) { options in
                    NavigationLink(options.tagName, value: SelectionState.sidebarMenu2(options))
                }
                
            }
            
            #if os(macOS)
                
            #else
                HStack{
                    Image(systemName: "gear")
                        .foregroundColor(.blue)
                    Text("Settings")
                }
                .tag(SelectionState.sidebarMenu3)
            #endif
        }
        .listStyle(.sidebar)
        .navigationTitle("")
//        List{
//            Section(header: Text("Oddesy of  Life")){
//                MainMenuView()
//            }
//            Section(header: Text("Tags")){
//                TagColorView()
//            }
//            Section(header: Text("Extras")){
//                ExclusiveView()
//            }
//        }
    }
}

#Preview {
    SideBarView().environmentObject(ModelDataManager()).environmentObject(navStateManager())
}

