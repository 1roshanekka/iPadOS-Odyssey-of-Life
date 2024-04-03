//
//  AspectsView.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 01/04/24.
//

import SwiftUI

struct AspectsView: View {
    var body: some View {
        NavigationStack{
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.teal, .cyan, .green]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    Text("Your life is a journey, keep trying and failing, until you reach the goal")
                }
            }
            .foregroundColor(.white) // Set text color to white for better contrast
        }
        .navigationTitle("Aspects of Life")
    }
    
}

#Preview {
    AspectsView()
}
