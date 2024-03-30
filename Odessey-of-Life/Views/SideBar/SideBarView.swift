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
            
            Section(header: Text("Oddesy of  Life")){
                VStack(alignment: .leading, spacing: 8){
                    ForEach(dataManager.sidebarMenu1) { options in
                        Button(options.menuName){
                            navigationManager.selectionState = SelectionState.sidebarMenu1(options)
                        }
                        .buttonStyle(PlainButtonStyle())
//                        HStack{
//                            Image(systemName: options.iconName)
//                            Text(options.menuName)
//                        }
                    }
                }
            }
            Section(header: Text("Tags")){
                VStack(alignment: .leading, spacing: 8){
                    ForEach(dataManager.sidebarMenu2) { options in
                        Button(options.tagName){
                            navigationManager.selectionState = SelectionState.sidebarMenu2(options)
                        }
                        .buttonStyle(PlainButtonStyle())
//                        HStack{
//                            Image(systemName: options.iconName)
//                            Text(options.menuName)
//                        }
                    }
                }
            }
            
            Divider()
            
            Text("Settings")
                .tag(SelectionState.sidebarMenu3)
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
