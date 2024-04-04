//
//  PhotoPickerView.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 04/04/24.
//

import SwiftUI

struct PhotoPickerView: View {
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .toolbar{
            ToolbarItemGroup(placement: .primaryAction) {
                Button("Done") {
                    // commit changes
                    savePhotos()
                }
                .bold()
                .foregroundStyle(Color.blue)
            }
        }
    }
    
    func savePhotos(){
        // save photos
        
    }
}

#Preview {
    PhotoPickerView()
}
