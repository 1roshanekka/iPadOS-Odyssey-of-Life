//
//  TodayView.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 01/04/24.
//
import SwiftData
import SwiftUI

struct TodayView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var navigationManager: navStateManager
    
    let currentDate = Date()
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, dd MMMM"
        return formatter
    }()
    
    @Binding var selectedDate: Date? // Binding to selected date
    
//    @State private var journalEntry: String = ""
    
    @State private var isShowingPhotoPicker: Bool = false
    @State private var isRecordingAudio: Bool = false
    @State private var isShowingLocationPicker: Bool = false
    
    @Bindable var editNote: journalDataModel
    
    @Query var dailyNotes: [journalDataModel]
//    @Bindable var editNote: journalDataModel = journalDataModel()
//    @FetchRequest<journalDataModel>(sortDescriptors: []) private var fetchedEntries: FetchedResults<journalDataModel>

    
    var body: some View {
        VStack{
            Form{
                Section{
                    TextField("How is your day going?..", text: $editNote.entryNote, axis: .vertical)
                        .padding(.bottom    , 200)
                    
                    VStack(alignment: .center){
//                        Text(currentDate, formatter: dateFormatter)
                        Text(selectedDate.map { dateFormatter.string(from: $0) } ?? "No date selected")
                    }
                    List{
                        ForEach(dailyNotes){ note in
                            
                            NavigationLink(value: note){
                                Text(note.entryNote)
                            }
                        }
                    }
                    
                }
                
                //            }
                
                
#if os(iOS)
                Group{
                    HStack(alignment: .center)
                    {
                        Spacer()
                        Button(action: {
                            // Action for adding photo
                            self.isShowingPhotoPicker = true
                        }) {
                            HStack {
                                Image(systemName: "photo")
                            }
                        }
                        .sheet(isPresented: $isShowingPhotoPicker) {
                            // Photo picker view goes here
//                            PhotoPickerView()
                        }
                        
                        Spacer()
                        Button(action: {
                            // Action for recording audio
                            //                                self.isRecordingAudio.toggle()
                            self.isRecordingAudio = true
                        }) {
                            HStack {
                                Image(systemName: "mic")
                            }
                        }
                        .sheet(isPresented: $isRecordingAudio) {
                            // Photo picker view goes here
                            // PhotoPickerView()
                        }
                        
                        Spacer()
                        Button(action: {
                            // Action for adding location
                            //                                self.isShowingLocationPicker.toggle()
                            self.isShowingLocationPicker = true
                        }) {
                            HStack {
                                Image(systemName: "location")
                            }
                        }
                        .sheet(isPresented: $isShowingLocationPicker) {
                            // Photo picker view goes here
                            // PhotoPickerView()
                        }
                        
                        Spacer()
                    }
                    .font(.title3)
                    .padding()
                }
            
            
#else
            Group{
                HStack{
                    Button(action: {
                        // Action for adding photo
                        self.isShowingPhotoPicker.toggle()
                    }) {
                        HStack {
                            Image(systemName: "photo")
                            Text("Add Photo")
                        }
                    }
                    Button(action: {
                        // Action for recording audio
                        self.isRecordingAudio.toggle()
                    }) {
                        HStack {
                            Image(systemName: "mic")
                            Text("Add Audio Recording")
                        }
                    }
                    Button(action: {
                        // Action for adding location
                        self.isShowingLocationPicker.toggle()
                    }) {
                        HStack {
                            Image(systemName: "location")
                            Text("Add Location")
                        }
                    }
                }
            }
            
#endif
            //            Spacer()
        }
            
        }
//        .onChange(of: selectedDate) { newDate in
//            // Update the view or trigger any actions here based on the selected date
//            if let newDate = newDate {
//                
//                // Perform any necessary actions here based on the new selected date
//            }
//        }
        .onChange(of: selectedDate) { newDate in
            if let newDate = newDate {
                print("Selected date changed to: \(newDate)")
                doneSave()
                // Access the first fetched entry (assuming single entry per date)
//                if let entry = fetchedEntries.first {
//                    editNote.entryNote = entry.entryNote // Update text field
//                    
//                } else {
//                    // Handle case where no entry exists for the selected date
//                    print("No entry found for selected date")
//                }
            }
        }

        .toolbar{
            ToolbarItemGroup(placement: .primaryAction) {
//                Button("Done") {
//                    // commit changes
//                    doneSave()
////                    addJournal()
//                }
//                .bold()
//                .foregroundStyle(Color.blue)
                Button {
                    //add to best memories
                } label: {
                    Image(systemName: "heart")
                }
            }
         
            //#endif
            ////                ToolbarItem {
            ////                    Button(action: addItem) {
            ////                        Label("Add Item", systemImage: "plus")
            ////                    }
            ////                }
            //        }
            //
        }
    }
    func doneSave(){
        print("Saving in progress...")
        let note = journalDataModel(entryNote: "", entryDate: Date())
        modelContext.insert(note)
        
//        presentationMode.wrappedValue.dismiss()
    }
}
  
//        #if os(iOS)
//        .navigationBarTitle("New Journal Entry")
//        #else
//        .frame(minWidth: 300, minHeight: 400)
//        #endif
        
        
//
//#Preview {
//    TodayView(selectedTab: )
//}
