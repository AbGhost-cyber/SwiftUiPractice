//
//  ShapeViews.swift
//  swiftUiPractice
//
//  Created by dremobaba on 2022/12/26.
//

import SwiftUI

struct ShapeViews: View {
    var body: some View {
        ZStack {
          //  Circle()
//            Capsule(style: .circular)
//                .stroke(Color.blue)
    //            .fill(.blue)
    //            .foregroundColor(.pink)
                //.stroke(Color.red)
              //  .stroke(Color.blue, lineWidth: 10)
                //.stroke(Color.orange, style: StrokeStyle(lineWidth: 20, lineCap: .round, dash: [30]))
//                .trim(from: 0.0,to: 1.0)
//                .stroke(Color.purple, lineWidth: 50)
            RoundedRectangle(cornerRadius: 12)
                .frame(width:.infinity, height: 65)
                .padding(.horizontal, 15)
            Text("Login with Apple 🤩")
                .foregroundColor(.white)
                .font(.headline)
        }
    }
}

struct ShapeViews_Previews: PreviewProvider {
    static var previews: some View {
        ShapeViews()
    }
}
