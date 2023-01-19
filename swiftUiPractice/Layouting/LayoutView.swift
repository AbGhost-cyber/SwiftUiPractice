//
//  LayoutView.swift
//  swiftUiPractice
//
//  Created by dremobaba on 2023/1/18.
//

import SwiftUI
struct HalfCard: View {
    var body: some View {
        VStack {
            Image(systemName: "crown.fill")
                .font(.system(size: 80))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .overlay(alignment: .topLeading) {
            VStack {
                Image(systemName: "crown.fill")
                    .font(.body)
                Text("Q")
                    .font(.largeTitle)
                Image(systemName: "heart.fill")
                    .font(.title)
            }
            .padding()
        }
        .border(.green)
    }
}

struct LayoutView: View {
    var body: some View {
          VStack {
              HalfCard()
              HalfCard()
                  .rotationEffect(.degrees(180))
          }
          .background(
              RoundedRectangle(cornerRadius: 10)
                  .stroke(Color.black)
          )
          .aspectRatio(0.70, contentMode: .fit)
          .foregroundColor(.red)
          .padding()
      }
}

struct LayoutView_Previews: PreviewProvider {
    static var previews: some View {
        LayoutView()
    }
}
