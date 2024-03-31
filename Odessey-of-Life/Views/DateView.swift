//
//  DateView.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 28/03/24.
//

import SwiftUI

struct DateView: View {
    var body: some View {
        InputForm()
    }
}

#Preview {
    DateView()
}

struct InputForm: View {
    
    @State private var text_entry : String = ""
    @State private var date_entry : Date = .now
    
    var body: some View {
        NavigationStack{
            Form{
//                TextField("Start typing your day today...", text: $text_entry)
                DatePicker("", selection: $date_entry, displayedComponents: .date)
                    .datePickerStyle(.graphical)
                TextField(text: $text_entry, prompt: Text("Start typing about your day today...")) {
                    //                        Text("Username")
                }
                .padding()
            }
            .navigationTitle("")
        }
    }
}
