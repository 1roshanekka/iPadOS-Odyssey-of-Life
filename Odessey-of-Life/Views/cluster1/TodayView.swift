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
            Form{
                Section{
                    TextField("How is you day going?..", text: $journalEntry)
                        .padding(.bottom, 400)
                }
                
#if os(iOS)
                Section{
                    HStack(alignment: .center)
                    {
                        Button(action: {
                            // Action for adding photo
                            self.isShowingPhotoPicker.toggle()
                        }) {
                            HStack {
                                Image(systemName: "photo")
                            }
                        }
                        Button(action: {
                            // Action for recording audio
                            self.isRecordingAudio.toggle()
                        }) {
                            HStack {
                                Image(systemName: "mic")
                            }
                        }
                        Button(action: {
                            // Action for adding location
                            self.isShowingLocationPicker.toggle()
                        }) {
                            HStack {
                                Image(systemName: "location")
                            }
                        }
                    }
                    .font(.title3)
                    .padding()
                }
#else
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
#endif
            }
        }
    }
}
            
  
//        #if os(iOS)
//        .navigationBarTitle("New Journal Entry")
//        #else
//        .frame(minWidth: 300, minHeight: 400)
//        #endif
        
        

#Preview {
    TodayView()
}
