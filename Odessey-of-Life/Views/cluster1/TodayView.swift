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
    @Query(sort: \journalDataModel.entryDate) var dailyNotes: [journalDataModel] = []
    
    @State var noteExisting : journalDataModel?
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var navigationManager: navStateManager
    
    //    let currentDate = Date()
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, dd MMMM"
        return formatter
    }()
    
    @Binding var selectedDate: Date? // Binding to selected date
    
    @State private var isShowingPhotoPicker: Bool = false
    @State private var isRecordingAudio: Bool = false
    @State private var isShowingLocationPicker: Bool = false
    
    @State var changedDate: Bool = false
    
    // note that we pass in to the view
    @Bindable var editNote: journalDataModel
    @State private var text = ""
    
    var noteFocussed: FocusState<Bool>.Binding

    var body: some View {
        NavigationStack{
            VStack(spacing:0){
                List{
                    VStack(spacing: 0){
                        //                List{
                        
                        TextEditor(text: $editNote.entryNote)
                        //                    .onChange(of: selectedDate) { newDate in
                        //                        text = dailyNotes.fetchText(for: newDate.rawValue) ?? ""
                        //                    }
                            .onAppear {
                                loadTextForDate(date: selectedDate)
                            }
                            .onChange(of: selectedDate) { newDate in
                                loadTextForDate(date: newDate)
//                                if let newDate = selectedDate {
//                                    print("Selected date changed to: \(newDate)")
//                                    print("updated on Today View")
//                                }
                            }
                            .onChange(of: noteFocussed.wrappedValue) { isFocused in
                                if !isFocused {
                                  // Dismiss keyboard on focus loss
//                                  UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                    print("is the TextEditor out of focus - \(!isFocused)")
                                    doneSave()
                                }
                              }
//                            .background(.red)ss
                            .textFieldStyle(.roundedBorder)
                            .focused(noteFocussed)
                            .cornerRadius(10)
                            .overlay(alignment: .topLeading, content: {
                                Text("How is your day going?..")
                                //                                .foregroundStyle(.white)
                                    .padding(5)
                                    .padding(.top, 4)
                                    .opacity(editNote.entryNote.isEmpty ? 1 : 0)
                                    .allowsHitTesting(false)
                            })
                        
                            .scrollContentBackground(.hidden)
                            .multilineTextAlignment(.leading)
//                            .padding(.top, 15)
                            .kerning(1.2)
                            .frame(maxWidth: .infinity)
                            .frame(height: 273)
//                            .background(Color(uiColor: .systemGray5))
                        
                        ////                        .background(.gray.opacity(0.15))
                        //                        .onSubmit {
                        //                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        //                            print("Content: \($editNote.entryNote)")
                        //                            if($editNote.entryNote.wrappedValue == ""){
                        //                                print("not saving as its empty\n")
                        //                            }
                        //                            else{
                        //                                doneSave()
                        //                                print("Pressed enter, saving...")
                        //                            }
                        //                        }
                        HStack(alignment: .firstTextBaseline){
                            // if nothing selected, shows the current date
                            Text(selectedDate != nil ? selectedDate.map { dateFormatter.string(from: $0) } ?? "" : dateFormatter.string(from: Date()))
                            Text("lala")
                        }
                        
                        
                        Spacer()
                        
                        //                }
                        //                List{
                        //                    ForEach(dailyNotes){ note in
                        //                        NavigationLink(value: note){
                        //                            Text(note.entryNote)
                        //                            Text(note.entryDateDisplay) // Display the formatted date
                        //                        }
                        //                    }
                        //                    .onDelete{ indexSet in
                        //                        for index in indexSet {
                        //                            modelContext.delete(dailyNotes[index])
                        //                        }
                        //                    }
                        //                }
                    }
                }
                List{
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
            }
//            .padding(10)
//            .background(.green)
            
            .navigationDestination(for: journalDataModel.self) { newView in
                EditDataView(editNote: newView)
            }
        }
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                    Button("Done") {
                        // Perform any action when "Done" is tapped
                        doneSave()
                    }
                    .padding(.horizontal)
                }
                ToolbarItemGroup(placement: .primaryAction) {
                    Button(action: {
                        // Add your action here
                        toggleFav()
                    }) {
                        Image(systemName: "heart")
                    }
                }
            }
    }
    func toggleFav(){
        print("favorite")
//        editNote.isFavorite = Toggle()
        doneSave()
    }
//    func loadTextForDate(date: Date?) {
//      let selectedDate = date ?? Date() // Use current date if date is nil
//        editNote.entryNote = "This is the text for \(dateFormatter.string(from: selectedDate)) and the stored data is "
//    }
    func loadTextForDate(date: Date?) {
      let selectedDate = date ?? Date() // Use current date if date is nil

      // 1. Filter dailyNotes to find the entry for the selected date
      guard let selectedEntry = dailyNotes.first(where: { $0.entryDate == selectedDate }) else {
        // No entry found for the selected date
//        editNote.entryNote = "This is the text for \(dateFormatter.string(from: selectedDate)) and no stored data found."
          
          editNote.entryNote = ""
        return
      }

      // 2. Update TextEditor content with retrieved entry data
//      editNote.entryNote = "This is the text for \(dateFormatter.string(from: selectedDate)) and the stored data is: \n\(selectedEntry.entryNote)"

        editNote.entryNote = "\(selectedEntry.entryNote)"
    }
    
    func doneSave(){
        print("Saving in progress...")
        
        // note object
        let note = journalDataModel(entryNote: $editNote.entryNote.wrappedValue, entryDate: selectedDate ?? Date())
            
        do {
            try modelContext.save()
            print("Data saved successfully!")
          } catch {
            print("Error saving data: \(error)")
          }
        
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
