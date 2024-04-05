//
//  MemoriesView.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 01/04/24.
//
import SwiftData
import SwiftUI

struct MemoriesView: View {
    @Environment(\.modelContext) var modelContext
    
    @State private var path = [journalDataModel]()
     
    @Query var dailyNotes: [journalDataModel]
    
    var body: some View {
        NavigationStack{
            
            //grids of 
            List{
                ForEach(dailyNotes){ note in
                    
                    NavigationLink(value: note){
                        Text(note.entryNote)
                    }
                }
            }
            .navigationDestination(for: journalDataModel.self) { newView in
//                VStack{
//                    Text(newView.entryNote)
//                    Text(newView.entryDate, format: .dateTime)
//                }
                
                ///directly go to edit mode rather than display of the data
                
                EditDataView(editNote: newView)
            }

            
        }
        .navigationTitle("Memories")
    }
}

#Preview {
    MemoriesView()
}
