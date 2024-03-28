//
//  MainMenuView.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 25/03/24.
//

import SwiftUI

struct MainMenuView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            HStack{
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                Text("Your Life Today")
            }
            HStack{
                Image(systemName: "swirl.circle.righthalf.filled.inverse")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.blue)
                Text("Aspects")
            }
        }
    }
}


#Preview {
    MainMenuView()
}
