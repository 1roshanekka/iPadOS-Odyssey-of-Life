//
//  TodayView.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 01/04/24.
//

import SwiftUI

struct TodayView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var navigationManager: navStateManager
    
    
    let currentDate = Date()
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, dd MMMM"
        return formatter
    }()
    
    //    @State var selectedTab = 0
    @Binding var selectedTab: Int
    
    
    @State private var journalEntry: String = ""
    @State private var isShowingPhotoPicker: Bool = false
    @State private var isRecordingAudio: Bool = false
    @State private var isShowingLocationPicker: Bool = false
    
    
    
    var body: some View {
        VStack{
            Form{
                Section{
                    TextField("How is you day going?..", text: $journalEntry)
                        .padding(.bottom, 300)
                    
                    VStack(alignment: .center){
                        Text(currentDate, formatter: dateFormatter)
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
            TabView(selection: $selectedTab){
//                                DateView()

                    Spacer()
                        .tag(0)
                        .tabItem {
                            Label("Date", systemImage: "calendar")
                            Text("Tab 1", comment: "Tab bar title")
                        }
                    
                    
//                                    ExclusiveView()
                    Spacer()
                        .tag(1)
                        .tabItem {
                            Label("Motivation", systemImage: "sparkles")
                            Text("Tab 1", comment: "Tab bar title")
                        }
    
            }
            .frame(height: 40)
            
        }
        .toolbar{
            ToolbarItemGroup(placement: .primaryAction) {
                Button("Done") {
                    // commit changes
                    doneSave()
                }
                .bold()
                .foregroundStyle(Color.blue)
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
        
        presentationMode.wrappedValue.dismiss()
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
