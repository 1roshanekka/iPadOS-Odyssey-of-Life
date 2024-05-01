//
//  DateView.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 28/03/24.
//

import SwiftUI

struct DateView: View {
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

    var body: some View {
            VStack {
                Form {
//                    DatePicker(caption: "Select Date", selection: $dateEntry, displayedComponents: .date)
                    DatePicker(selection: $dateEntry, displayedComponents: .date) {
                        Text("Date")
                    }
                    .frame(minWidth: 280)
                    .datePickerStyle(.graphical)
                    .onChange(of: dateEntry){ newValue in
                        if let onDateSelected = onDateSelected {
                            onDateSelected(newValue)
                            print("Selected date: \(newValue)")
                        }
                    }
                }
            }
        }
}

