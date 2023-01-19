//
//  MoodView.swift
//  swiftUiPractice
//
//  Created by dremobaba on 2023/1/19.
//

import SwiftUI

struct MoodView: View {
    let emojis = ["😢", "😴", "😁", "😡", "😐"]
    @Binding var value: String
    
    var body: some View {
        VStack {
            Text("What's your mood?")
                .foregroundColor(.brown)
                .font(.headline)
                .padding(.bottom)
            HStack {
                ForEach(emojis, id: \.self) { emoji in
                    Button {
                        value = emoji
                    } label: {
                        VStack {
                            Text(emoji)
                                .font(.system(size: 35))
                                .padding(.bottom)
                            Image(systemName: value == emoji ? "circle.fill": "circle")
                                .font(.system(size: 16))
                                .foregroundColor(.brown)

                        }
                    }
                    
                }
            }
        }
        .padding()
        .border(.brown)
    }
}

struct MoodView_Previews: PreviewProvider {
    static var previews: some View {
        MoodView(value: .constant("😡"))
    }
}
