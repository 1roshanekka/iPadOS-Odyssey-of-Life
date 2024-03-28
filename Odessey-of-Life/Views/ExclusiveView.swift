//
//  ExclusiveView.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 25/03/24.
//

import SwiftUI

struct ExclusiveView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            HStack{
                Text("✨")
                Text("Motivation")
            }
            HStack{
                Text("🙏")
                Text("Gratitude")
            }
        }
//        .padding(.bottom, 40)
    }
}

#Preview {
    ExclusiveView()
}
