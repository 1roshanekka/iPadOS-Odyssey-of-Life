//
//  dateModel.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 03/04/24.
//

import SwiftUI

struct dateModel: View {
    let currentDate = Date()
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, dd MMMM"
        return formatter
    }()

    var body: some View {
        Text("Current Date: \(currentDate, formatter: dateFormatter)")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        dateModel()
    }
}
