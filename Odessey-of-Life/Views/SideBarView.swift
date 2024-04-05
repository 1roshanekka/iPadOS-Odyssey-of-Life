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
        let menuColorMap: [Int: Color] = [
          1: .red,
          2: .blue,
          3: .green,
          // Add more mappings for other menu items
        ]
        
        NavigationStack{
            List(selection: $navigationManager.selectionState){
                
//                Section(header: Text("Odyssey of Life")){
                Section(){
                    ForEach(dataManager.sidebarMenu1) { options in
                        //                        NavigationLink(options.menuName, value: SelectionState.sidebarMenu1(options))
                        //                            .onAppear()
                        //                            {
                        //                                print(options)
                        //                            }
                        NavigationLink(value: SelectionState.sidebarMenu1(options)) {
                            HStack {
                                
                                Image(systemName: options.iconName)
                                    .foregroundStyle(menuColorMap[options.menuNo] ?? .black) // Use black as default
                                Text(options.menuName)
                            }
                        }
                    }
                    
                }
                
                #if os(macOS)
                    Section(header: Text("Tags")){
                        ForEach(dataManager.sidebarMenu2) { options in
                            NavigationLink(value: SelectionState.sidebarMenu2(options)) {
                                HStack {
                                    Image(systemName: options.iconName)
                                        .foregroundStyle(menuColorMap[options.menuNo] ?? .black) // Use black as default
                                    Text(options.tagName)
                                }
                            }
                        }
                        
                    }
                #else
                if UIDevice.current.userInterfaceIdiom == .pad {
                    Spacer()
                    Section(header: Text("Tags")){
                        ForEach(dataManager.sidebarMenu2) { options in
                            NavigationLink(value: SelectionState.sidebarMenu2(options)) {
                                HStack {
                                    Image(systemName: options.iconName)
                                        .foregroundStyle(menuColorMap[options.menuNo] ?? .black) // Use black as default
                                    Text(options.tagName)
                                }
                            }
                        }
                        
                    }
                }
                else{
                    Section(header: Text("Tags")){
                        ForEach(dataManager.sidebarMenu2) { options in
                            NavigationLink(value: SelectionState.sidebarMenu2(options)) {
                                HStack {
                                    Image(systemName: options.iconName)
                                        .foregroundStyle(menuColorMap[options.menuNo] ?? .black) // Use black as default
                                    Text(options.tagName)
                                }
                            }
                        }
                        
                    }
                }
                
                if UIDevice.current.userInterfaceIdiom == .pad {
                    Spacer()
                    HStack{
                        Image(systemName: "gear")
                            .foregroundColor(.blue)
                        Text("Settings")
                    }
                    .tag(SelectionState.sidebarMenu3)
                }
                else{
                    HStack{
                        Image(systemName: "gear")
                            .foregroundColor(.blue)
                        Text("Settings")
                    }
                    .tag(SelectionState.sidebarMenu3)
                }
                
                #endif
                
            }
            .listStyle(.sidebar)
            .navigationTitle("Life")
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
}

#Preview {
    SideBarView().environmentObject(ModelDataManager()).environmentObject(navStateManager())
}

