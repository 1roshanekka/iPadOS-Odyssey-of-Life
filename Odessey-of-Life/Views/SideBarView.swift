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
        List{
            Section(header: Text("Oddesy of  Life")){
                VStack(alignment: .leading, spacing: 8){
                    ForEach(dataManager.sidebarMenu1) { options in
//                        Button(options.menuName){
//                            navigationManager.selectionState = SelectionState.appname(options)
//                        }
                        HStack{
                            Image(systemName: options.iconName)
                            Text(options.menuName)
                        }
                    }
                }
            }
            
            Divider()
            
            Text("Settings")
        }
        .listStyle(.sidebar)
        .navigationTitle("SideBar")
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
