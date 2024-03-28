//
//  TagColorView.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 25/03/24.
//

import SwiftUI

struct TagView: View {
    let title: String
    let color: Color

    var body: some View {
        HStack {
            Circle()
                .fill(color)
                .frame(width: 10, height: 10)
            
            Text(title)
                .padding(.leading, 5)
        }
    }
}

struct TagColorView: View{
    let tags: [(String, Color)] = [
            ("Work", .blue),
            ("Personal", .green),
            ("Important", .orange)
        ]
    
    var body: some View {
            VStack(alignment: .leading, spacing: 8) {

                ScrollView(.horizontal, showsIndicators: false) {
                    VStack(alignment: .leading) {
                        ForEach(tags, id: \.0) { tag in
                            TagView(title: tag.0, color: tag.1)
                        }
                    }
                }
            }

        }
}

#Preview {
    TagColorView()
}
