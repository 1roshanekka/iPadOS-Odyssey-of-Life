//
//  ContentView.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 25/03/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @StateObject var dataManager = ModelDataManager()
    @StateObject var navigationStateManager = navStateManager()
    
    @State private var searchItem : String = ""
    
    @State private var columnVisibility = NavigationSplitViewVisibility.detailOnly
    
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            /*
             List {
             ForEach(items) { item in
             NavigationLink {
             Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
             } label: {
             Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
             }
             }
             .onDelete(perform: deleteItems)
             }
             
             .toolbar {
             #if os(iOS)
             //                ToolbarItem(placement: .navigationBarTrailing) {
             //                    EditButton()
             //                }
             #endif
             //                ToolbarItem {
             //                    Button(action: addItem) {
             //                        Label("Add Item", systemImage: "plus")
             //                    }
             //                }
             }
             */
            SideBarView()
#if os(macOS)
                .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
        }
        detail: {
            DiaryView()
        }
        .searchable(text: $searchItem, placement: .sidebar, prompt: "Moments")
        .environmentObject(dataManager)
        .environmentObject(navigationStateManager)
        .navigationTitle("Ode to your Life")
    }
}

    
    /*
    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
     */

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
