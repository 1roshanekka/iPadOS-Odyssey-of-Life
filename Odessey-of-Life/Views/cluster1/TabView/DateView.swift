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
        InputForm(selectedDate: $selectedDate)
    }
}

struct InputForm: View {
    @Binding var selectedDate: Date?

    @State private var dateEntry: Date

    init(selectedDate: Binding<Date?>) {
        _selectedDate = selectedDate
        _dateEntry = State(initialValue: selectedDate.wrappedValue ?? Date())
    }

    var body: some View {
        VStack {
            Form {
                DatePicker(selection: $dateEntry, displayedComponents: .date) {
                    Text("Select Date")
                }
                .frame(minWidth: 280)
                .datePickerStyle(.graphical)
                .onChange(of: dateEntry) { newValue in
                    selectedDate = newValue
                    print("Selected date: \(newValue)")
                }
            }
        }
    }
}
