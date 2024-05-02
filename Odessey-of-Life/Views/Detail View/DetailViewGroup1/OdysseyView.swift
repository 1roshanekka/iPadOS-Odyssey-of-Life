//
//  OdysseyView.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 31/03/24.
//

/* view of common */
import SwiftData
import SwiftUI

extension View {
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        
        
        //hides keyboard
        // implement that when the text field empty then dont save if something typed then save it
        
    }
}

struct OdysseyView: View {
    
    @EnvironmentObject var navigationManager: navStateManager
    @EnvironmentObject var dataManager : ModelDataManager
    
    
    @Environment(\.modelContext) var modelContext
    @State private var path = [journalDataModel]()

    @Query var dailyNotes: [journalDataModel]
    
    
//    @State private var selectedEditNote: journalDataModel = journalDataModel(entryNote: "", entryDate: Date())
    
    @State private var selectedTab = 0
    @State private var selectedDate: Date? = nil // Selected date
    
    
    let passedVar : menu1
    
    var body: some View {
        
        VStack {
            switch passedVar.menuNo {
                case 1:
//                NavigationSplitView(columnVisibility: $columnVisibility) {
//                    if selectedTab == 0 {
//                        DateView(selectedDate: $selectedDate) // Pass the binding to DateView
//                            .toolbar(removing: .sidebarToggle)
//                    } else {
//                        ExclusiveView()
//                            .toolbar(removing: .sidebarToggle)
//                    }
//                } detail: {
//                    NavigationStack(path: $path){
//                        TodayView(selectedDate: $selectedDate, editNote: journalDataModel(entryNote: "", entryDate: Date()))
                GeometryReader { geometry in
                    HStack(spacing: 0) {
                            Group{
                                if(selectedTab==0) {
                                    DateView(selectedDate: $selectedDate)
                                }
                                else {
                                    ExclusiveView()
                                }
                            }
                            .frame(width: 350)
//                                Spacer()
                            TodayView(selectedDate: $selectedDate, editNote: journalDataModel(entryNote: "", entryDate: Date()))
                        }
                    }

                VStack{
                    TabView(selection: $selectedTab){
                        //                        Spacer()
                        Text("")
                            .tag(0)
                            .tabItem {
                                Label("Date", systemImage: "calendar")
                                Text("Tab 1", comment: "Tab bar title")
                            }
                        //                        Spacer()
                        Text("")
                            .tag(1)
                            .tabItem {
                                Label("Motivation", systemImage: "sparkles")
                                Text("Tab 1", comment: "Tab bar title")
                            }
                        
                    }
                }.frame(height: 40)
//                    .toolbar {
//                        Button("Done", action: addJournal)
//                    }


//                    TodayView(selectedTab: $selectedTab, selectedDate: $selectedDate)
                
                case 2:
                    AspectsView()
                case 3:
                    MemoriesView()
                default:
                    EmptyView()
                }
            
        }
        .onTapGesture {
            self.hideKeyboard()
        }
//        .onReceive(selectedDate.publisher, perform: { date in
//            // Do something with the selected date
//            if let date = date {
//                print("Selected date:", date)
//                // You can update your model or perform any action with the selected date here
//            }
//        })
//        .onAppear(){
//            print(navigationManager)
//            print(dataManager)
//        }
    }
    func addJournal(){
        let note = journalDataModel(entryNote: "", entryDate: Date())
        modelContext.insert(note)
    }
}

//#Preview {
//    OdysseyView(passedVar: menu1Items[1])
//}
