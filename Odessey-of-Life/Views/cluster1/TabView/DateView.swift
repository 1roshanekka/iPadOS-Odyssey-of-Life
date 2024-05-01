//
//  DateView.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 28/03/24.
//

import SwiftUI

struct DateView: View {
//    @State private var selectedDate: Date?
    
    //    @State var selectedTab = 0
    
    @Binding var selectedDate: Date? // Binding to selected date
    var body: some View {
        InputForm { date in
            // Handle the selected date here
            self.selectedDate = date
        }
        .onDisappear {
            // Do something with selectedDate when DateView disappears, if needed
            
        }
    }
}
struct InputForm: View {
            
    @State private var dateEntry: Date = Date()
    var onDateSelected: ((Date) -> Void)? // Closure to pass selected date
    
//    var body: some View {
//        NavigationStack{
//            Form{
////                TextField("Start typing your day today...", text: $text_entry)
//                DatePicker("", selection: $date_entry, displayedComponents: .date)
//                    .datePickerStyle(.graphical)
////                TextField(text: $text_entry, prompt: Text("Start typing about your day today...")) {
////                    //                        Text("Username")
////                }
//                
//            }
//            .navigationTitle("")
//        }
//    }
    var body: some View {
            VStack {
                Form {
//                    DatePicker(caption: "Select Date", selection: $dateEntry, displayedComponents: .date)
                    DatePicker(selection: $dateEntry, displayedComponents: .date) {
                        Text("Date")
                    }
                    .frame(minWidth: 280)
                    .onTapGesture(count: 1) {
                        // Handle tap within the DatePicker
                    }
                    .font(.caption)
                    .datePickerStyle(.graphical)
                    .onChange(of: dateEntry){ oldValue, newValue in
                        if let onDateSelected = onDateSelected {
                            onDateSelected(dateEntry)
                            print("Selected date: \(dateEntry)")
                        }
                    }
                }

//                .navigationBarItems(trailing: Button("Done") {
//                    // Pass the selected date through the closure
//                    if let onDateSelected = onDateSelected {
//                        onDateSelected(dateEntry)
//                        print("Selected date: \(dateEntry)") // Print selected date
//                    }
//                })
            }
        }
}

