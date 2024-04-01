//
//  TodayView.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 01/04/24.
//

import SwiftUI

struct TodayView: View {
    @State private var journalEntry: String = ""
    @State private var isShowingPhotoPicker: Bool = false
    @State private var isRecordingAudio: Bool = false
    @State private var isShowingLocationPicker: Bool = false
    
    var body: some View {
#if os(iOS)
        return NavigationStack {
            formBody
        }
#else
        return formBody
#endif
    }
    
    var formBody: some View {
        VStack{
            Form {
                ScrollView {
                    TextField(text: $journalEntry, prompt: Text("How was your day?.."))
                    {
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .frame(minHeight: 200, maxHeight: .infinity)
            }
            #if os(iOS)
                Button(action: {
                    // Action for adding photo
                    self.isShowingPhotoPicker.toggle()
                }) {
                    HStack {
                        Image(systemName: "photo")
                    }
                }
            #else
                Button(action: {
                    // Action for adding photo
                    self.isShowingPhotoPicker.toggle()
                }) {
                    HStack {
                        Image(systemName: "photo")
                        Text("Add Photo")
                    }
                }
            #endif
        }
    }
}
            
//                #if os(iOS)
//                    
//                    Button(action: {
//                        // Action for adding photo
//                        self.isShowingPhotoPicker.toggle()
//                    }) {
//                        HStack {
//                            Image(systemName: "photo")
//                        }
//                    }
//                    Button(action: {
//                        // Action for recording audio
//                        self.isRecordingAudio.toggle()
//                    }) {
//                        HStack {
//                            Image(systemName: "mic")
//                        }
//                    }
//                    Button(action: {
//                        // Action for adding location
//                        self.isShowingLocationPicker.toggle()
//                    }) {
//                        HStack {
//                            Image(systemName: "location")
//                        }
//                    }
//                #else
//                    Section(header: Text("Add to Your Entry")) {
//                        Button(action: {
//                            // Action for adding photo
//                            self.isShowingPhotoPicker.toggle()
//                        }) {
//                            HStack {
//                                Image(systemName: "photo")
//                                Text("Add Photo")
//                            }
//                        }
//                        Button(action: {
//                            // Action for recording audio
//                            self.isRecordingAudio.toggle()
//                        }) {
//                            HStack {
//                                Image(systemName: "mic")
//                                Text("Record Audio")
//                            }
//                        }
//                        Button(action: {
//                            // Action for adding location
//                            self.isShowingLocationPicker.toggle()
//                        }) {
//                            HStack {
//                                Image(systemName: "location")
//                                Text("Add Location")
//                            }
//                        }
//                    }
//                #endif
  
//        #if os(iOS)
//        .navigationBarTitle("New Journal Entry")
//        #else
//        .frame(minWidth: 300, minHeight: 400)
//        #endif
        
        

#Preview {
    TodayView()
}
