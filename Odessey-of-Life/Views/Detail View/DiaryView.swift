//
//  DiaryView.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 31/03/24.
//

import SwiftUI

struct DiaryView: View {
    
    @State private var enteredText: String = ""
    @EnvironmentObject var navigationManager: navStateManager
    
    var body: some View {
        
        if let state = navigationManager.selectionState {
            switch state {
            case .sidebarMenu1(let menu1):
                OdysseyView(passedVar: menu1)
            case .sidebarMenu2(let menu2):
                TagView(passedVar: menu2)
            case .sidebarMenu3:
                settingsView()
            }
        }
        else{
            Text("Select something")
        }
//        VStack{
//            Text("")
//            Form {
//                TextField(text: $enteredText, prompt: Text("Required")) {
////                    Text("Username")
//                }
//            }
//            VStack{
//                HStack{
//                    Button(action: addPhotos, label: {
//                        Image(systemName: "photo.fill")
//                    })
//                    Button(action: addPhotos, label: {
//                        Image(systemName: "mic.fill")
//                    })
//                    Button(action: addPhotos, label: {
//                        Image(systemName: "photo.fill")
//                    })
//                }
//            }
//        }
    }
}

#Preview {
    DiaryView().environmentObject(navStateManager())
}


