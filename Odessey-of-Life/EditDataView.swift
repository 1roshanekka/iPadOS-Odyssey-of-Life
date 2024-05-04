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
        ZStack{
//            Form{
//                Section{
//                    TextField("How's your day going?.. ", text: $editNote.entryNote, axis: .vertical)
//                }
//            }
            VStack{
                Text(editNote.entryNote)
                Spacer()
                Text(editNote.entryDateDisplay)
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
