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
    
    //    let currentDate = Date()
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
    
    
    @FocusState private var noteFocussed: Bool
    
    @Bindable var editNote: journalDataModel
    
    @Query var dailyNotes: [journalDataModel]
    //    @Bindable var editNote: journalDataModel = journalDataModel()
    //    @FetchRequest<journalDataModel>(sortDescriptors: []) private var fetchedEntries: FetchedResults<journalDataModel>
    
    // Fetch the journal entry for the selected date
    func fetchJournalEntry(for date: Date) -> journalDataModel? {
        return dailyNotes.first { $0.entryDate == date }
    }

    var body: some View {
        NavigationStack{
            VStack{
                Form{
                    Section{
                        TextField("How is your day going?..", text: $editNote.entryNote, axis: .vertical)
                            .focused($noteFocussed)
                        //                            .padding(.bottom    , 240)
                            .onSubmit {
                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                print("\($editNote.entryNote)")
                                print("pressed enter i guess , now saving")
                                doneSave()
                            }
                        
                        if let selectedDate = selectedDate {
                            if let entry = fetchJournalEntry(for: selectedDate) {
                                Text(entry.entryNote)
                            } else {
                                // Clear the TextField if no entry exists for the selected date
                                Text("")
                            }
                        }
                        
                        VStack(alignment: .center){
                            Text(selectedDate.map { dateFormatter.string(from: $0) } ?? "No date selected")
                        }
                        List{
                            ForEach(dailyNotes){ note in
                                NavigationLink(value: note){
                                    Text(note.entryNote)
                                    Text(note.entryDateDisplay) // Display the formatted date
                                }
                            }
                        }
                        
                    }
                    
                    
                    /*
                     
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
                     
                     */
                    
                    
                }
                
            }
            .navigationDestination(for: journalDataModel.self) { newView in
                EditDataView(editNote: newView)
            }
        }
        
        .onChange(of: selectedDate) { newDate in
            if let newDate = newDate {
                print("Selected date changed to: \(newDate)")
                print("updated on Today View")
            }
        }
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                    Button("Done") {
                        noteFocussed = false
                        // Perform any action when "Done" is tapped
                        doneSave()
                    }
                    .padding(.horizontal)
                }
                ToolbarItemGroup(placement: .primaryAction) {
                    Button(action: {
                        // Add your action here
                    }) {
                        Image(systemName: "heart")
                    }
                }
            }
    }
    func doneSave(){
        print("Saving in progress...")
        let note = journalDataModel(entryNote: $editNote.entryNote.wrappedValue, entryDate: Date())
        modelContext.insert(note)
        print("Saved !")
//        presentationMode.wrappedValue.dismiss()
        // Format the date for display
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy" // Adjust the format as desired
            let formattedDate = dateFormatter.string(from: note.entryDate)

            // Add the formatted date to the note
            note.entryDateDisplay = formattedDate

//            path.append(note)
        
    }
}
            // Add gesture recognizer to the entire VStack
//              .gesture(
//                TapGesture()
//                  .onEnded {
//                    if !editNote.entryNote.isEmpty {
////                      self.endEditing(of: ) // Dismiss the keyboard
//                      doneSave() // Save the note
//                    }
//                  }
//              )
//              .edgesIgnoringSafeArea(.all) // Ignore safe area insets
//            
        
//        .onChange(of: selectedDate) { newDate in
//            // Update the view or trigger any actions here based on the selected date
//            if let newDate = newDate {
//                
//                // Perform any necessary actions here based on the new selected date
//            }
//        }
//        .onChange(of: editNote.entryNote) { newValue in
//            if !newValue.isEmpty && (newValue.last == "\n") {
//                // Save the note when something is entered and Enter is pressed
//                doneSave()
//            }
//        }
        
        
//                doneSave()
                
                // Access the first fetched entry (assuming single entry per date)
//                if let entry = fetchedEntries.first {
//                    editNote.entryNote = entry.entryNote // Update text field
//                    
//                } else {
//                    // Handle case where no entry exists for the selected date
//                    print("No entry found for selected date")
//                }
    
//
//#Preview {
//    TodayView(selectedTab: )
//}
