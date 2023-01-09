//
//  PlayView.swift
//  swiftUiPractice
//
//  Created by dremobaba on 2023/1/9.
//

import SwiftUI

struct PlayView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                CardView()
                    .frame(height: 200)
                    .padding(.horizontal, 24)
                Text("Categories")
                    .font(.custom("ProductSans-Bold", size: 23))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(24)
                HStack {
                    VStack {
                        CardView(title: "Debit", color: .black)
                            .frame(width: 160, height: 200)
                        CardView(title: "Bank")
                            .frame(width: 160, height: 100)
                    }
                    VStack {
                        CardView(title: "NFTs", color: .magenta)
                            .frame(width: 160, height: 150)
                        CardView(title: "Coins", color: .systemTeal)
                            .frame(width: 160, height: 150)
                    }
                }
                Text("Transactions")
                    .font(.custom("ProductSans-Bold", size: 23))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(24)
                ForEach(0..<20) { i in
                    TransactionRow(position: i+1)
                    Divider()
                        .opacity(i == 19 ? 0 : 1)
                }
                .padding(.horizontal, 10)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName:"line.3.horizontal.decrease")
                }
                ToolbarItem(placement: .principal) {
                    Text("Wallet")
                        .font(.custom("ProductSans-Bold", size: 19))
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "person.crop.circle")
                }
            }
        }
    }
}

struct TransactionRow: View {
    let position: Int
    var body: some View {
        HStack(spacing: 12) {
            VStack {
                Text("\(position)")
                    .font(.custom("ProductSans-Bold", size: 20))
            }
            .foregroundColor(.white)
            .frame(width: 50, height: 50)
            .background(Color.blue)
            .mask(RoundedCorner(radius: 30, corners: [.topRight, .bottomLeft]))
            VStack(alignment: .leading) {
                Text("Groceries")
                    .font(.custom("ProductSans-Bold", size: 18))
                Text("3 transactions")
                    .foregroundColor(.gray)
                    .font(.custom("ProductSans-Regular", size: 14))
            }
            Spacer()
            Text("$360")
                .font(.custom("ProductSans-Regular", size: 16))
                .fontWeight(.regular)
        }
    }
}

struct CardView: View {
    var title: String = "Cards"
    var color: UIColor = .blue
    var body: some View {
        Button {
            //TODO: add action
        } label: {
            VStack {
                Text(title).font(.custom("ProductSans-Bold", size: 24))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .padding(30)
            }
            .foregroundColor(.white)
            .background(Color(uiColor: color))
            .cornerRadius(10)
            .mask(RoundedCorner(radius: 30, corners: [.topLeft, .bottomRight]))
        }

    }
}
struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
