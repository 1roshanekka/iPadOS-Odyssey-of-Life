//
//  entryView.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 02/04/24.
//

import SwiftUI

struct entryView: View {
    
    @Binding var journalEntry: String
    let placeholder: String = "How is your day going?.."
    
    
    var body: some View {
        ZStack(alignment: .topLeading){
            if journalEntry.isEmpty {
                Text(placeholder)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
            }
            TextEditor(text: $journalEntry)
                .padding(100)
        }
        .font(.body)
    }
}

#Preview {
    entryView(journalEntry: .constant("String"))
}
