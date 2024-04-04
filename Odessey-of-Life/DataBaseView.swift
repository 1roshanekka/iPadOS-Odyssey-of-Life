//
//  DataBaseView.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 05/04/24.
//
import SwiftData
import SwiftUI



struct DataBaseView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @State private var path = [journalDataModel]()
     
    @Query var dailyNotes: [journalDataModel]
    
    var body: some View {
        NavigationStack(path: $path){
            List{
                ForEach(dailyNotes){ note in
                    NavigationLink(value: note){
//                        Text(note.entryDate, format: .dateTime)
                        Text(note.entryNote)
                    }
                }
            }
            .navigationTitle("Data")
            /*
            .navigationDestination(for: dailyNotes.self) { newView in
            Cannot convert value of type '[journalDataModel]' to expected argument type 'D.Type'
             */
            // we should pass in the original array
            
            .navigationDestination(for: journalDataModel.self) { newView in
//                VStack{
//                    Text(newView.entryNote)
//                    Text(newView.entryDate, format: .dateTime)
//                }
                
                ///directly go to edit mode rather than display of the data
                
                EditDataView(editNote: newView)
            }
            .toolbar {
                Button("Done", systemImage: "plus", action: addJournal)
            }
        }
    }
    
    func addJournal(){
        let note = journalDataModel(entryNote: "", entryDate: Date())
        modelContext.insert(note)
        
        path.append(note)
    }
}

#Preview {
    DataBaseView()
}
