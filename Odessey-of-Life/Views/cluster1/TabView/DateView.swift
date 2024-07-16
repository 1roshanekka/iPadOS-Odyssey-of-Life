//
//  DateView.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 28/03/24.
//

import SwiftUI
import SwiftData



struct DateView: View {
    @Binding var selectedDate: Date? // Binding to selected date
    @State var dateEntry: Date

    
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
                }
            }
        }
    }
}
