//
//  MChildView.swift
//  swiftUiPractice
//
//  Created by dremobaba on 2023/1/3.
//

import SwiftUI

struct MChildView: View {
    let mock: Mock
    
    var body: some View {
        VStack(spacing: 0) {
            Image(mock.image)
                .resizable()
               // .scaledToFit()
                .frame(maxWidth: .infinity)
                .frame(maxHeight: 150)
                
            VStack {
                Text(mock.name)
                    .font(.headline)
                Text(mock.subText)
                    .font(.caption)
                    .foregroundColor(.black.opacity(0.5))
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(Color.blue.opacity(0.5))
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.blue.opacity(0.5))
        }
        
    }
}

struct MChildView_Previews: PreviewProvider {
    static var previews: some View {
        MChildView(mock: Mock(name: "Ab", subText: "Dec 21, 2021"))
    }
}
