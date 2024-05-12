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
    
    // fetching the data
    @Query var dailyNotes: [journalDataModel] = []
    
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
    
    @State var changedDate: Bool = false
    
    @FocusState private var noteFocussed: Bool
    
    @Bindable var editNote: journalDataModel
    
    
    
    

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
                                print("Content: \($editNote.entryNote)")
                                if($editNote.entryNote.wrappedValue == ""){
                                    print("not saving as its empty\n")
                                }
                                else{
                                    doneSave()
                                    print("Pressed enter, saving...")
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
                            .onDelete{ indexSet in
                                for index in indexSet {
                                    modelContext.delete(dailyNotes[index])
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

//                fetchData(for: newDate)
                
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
        
        // note object
        let note = journalDataModel(entryNote: $editNote.entryNote.wrappedValue, entryDate: Date())
            
        // to save it in container
        modelContext.insert(note)
        
        print("autosaved")
        
        /*
         
        // we dont trust autosave
        try! modelContext.save()
         
        */
        
//        presentationMode.wrappedValue.dismiss()
        
        // THE DISPLAY PART 
        // Format the date for display
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy" // Adjust the format as desired
            let formattedDate = dateFormatter.string(from: note.entryDate)

            // Add the formatted date to the note
            note.entryDateDisplay = formattedDate

//            path.append(note)
        
    }
}
    
//
//#Preview {
//    TodayView(selectedTab: )
//}
