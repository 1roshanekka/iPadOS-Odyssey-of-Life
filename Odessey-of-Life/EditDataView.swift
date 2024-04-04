//
//  EditDataView.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 05/04/24.
//

import SwiftUI

struct EditDataView: View {
    
    @Bindable var editNote: journalDataModel
    
    var body: some View {
        VStack{
            Form{
                Section{
                    TextField("How's your day going?.. ", text: $editNote.entryNote, axis: .vertical)
                }
            }
        }
        .navigationTitle("Edit Journal")
        #if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
        
    }
}

//#Preview {
//    EditDataView()
//}
