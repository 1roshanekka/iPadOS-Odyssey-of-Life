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
     
    // fetching the data
    @Query(sort: \journalDataModel.entryDate) var dailyNotes: [journalDataModel] = []
    
    var body: some View {
        NavigationStack(path: $path){
            
            //grids of new
            List{
                ForEach(dailyNotes){ note in
                    NavigationLink(value: note){
                        VStack(alignment: .leading){
                            Text(note.entryNote)
                            Text(note.entryDateDisplay)
                                .font(.caption)
                                .foregroundColor(.secondary)
                            
                        }
                    }
                }
                .onDelete{ indexSet in
                    for index in indexSet {
                        modelContext.delete(dailyNotes[index])
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
            .toolbar {
                Button("Done", systemImage: "plus", action: doneSave)
            }

            
        }
        .navigationTitle("Memories")
    }
    func doneSave(){
        print("Saving in progress...")
        let note = journalDataModel(entryNote: "", entryDate: Date())
        modelContext.insert(note)
        print("Saved !")
//        presentationMode.wrappedValue.dismiss()
        // Format the date for display
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy" // Adjust the format as desired
            let formattedDate = dateFormatter.string(from: note.entryDate)

            // Add the formatted date to the note
            note.entryDateDisplay = formattedDate

            path.append(note)
        
    }
}

#Preview {
    MemoriesView()
}
