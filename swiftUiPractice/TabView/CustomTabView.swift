//
//  CustomTabView.swift
//  swiftUiPractice
//
//  Created by dremobaba on 2023/1/8.
//

import SwiftUI

struct CustomTabView: View {
    let items = ["Vagabond", "Shoes", "Accessories"]
    @State private var index = 0
    var body: some View {
        VStack {
            TabView(selection: $index) {
                ForEach(0..<3) { i in
                    Image("Profile")
                        .resizable()
                        .padding()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            HStack {
                ForEach(0..<3) { i in
                    let same = index == i
                    Color.blue
                        .frame(width: same ? 8 : 16, height: 8)
                        .opacity(same ? 1 : 0.5)
                        .animation(.easeInOut(duration: 0.4), value: same)
                }
            }
            ZStack {
                ForEach(0..<3) { i in
                    VStack {
                        Text(items[i])
                            .font(.custom("ProductSans-Bold", size: 30))
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation")
                            .multilineTextAlignment(.center)
                            .foregroundColor(.gray)
                            .padding([.top,.bottom])
                    }
                    .opacity(index == i ? 1 : 0)
                    .animation(.easeInOut(duration: 0.4), value: index == i)
                    .offset(CGSize(width: 0, height: index == i ? 0: 100))
                }
            }
//            TabView(selection: $index) {
//                VStack {
//                    Text(items[index])
//                        .font(.custom("ProductSans-Bold", size: 30))
//                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation")
//                        .multilineTextAlignment(.center)
//                        .foregroundColor(.gray)
//                        .padding([.top,.bottom])
//                }
//            }
//            .tabViewStyle(.page(indexDisplayMode: .never))
            Button(action: {}) {
                Text("Get Started")
                    .font(.custom("ProductSans-Bold", size: 20))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: 48)
                    .background(Color.blue)
                    .cornerRadius(12)
            }
        }
        .padding()
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}
