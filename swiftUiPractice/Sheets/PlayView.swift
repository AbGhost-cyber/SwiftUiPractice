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
                CardView(pos: 3, isCard: true)
                    .frame(height: 200)
                    .padding(.horizontal, 24)
                Text("Categories")
                    .font(.custom("ProductSans-Bold", size: 23))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(24)
                HStack(spacing: 10) {
                    VStack {
                        CardView(title: "Transfer Money", pos: 1)
                            .frame(width: 160, height: 150)
                        CardView(title: "Total Withdraw", pos: 2)
                            .frame(width: 160, height: 150)
                    }
                    VStack {
                        CardView(title: "Total Deposit", pos: 3)
                            .frame(width: 160, height: 150)
                        CardView(title: "Money Exchange", pos: 4)
                            .frame(width: 160, height: 150)
                    }
                }
                HStack {
                    Text("Your Wallets")
                        .font(.custom("ProductSans-Bold", size: 23))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    Label {
                        Image(systemName: "chevron.right")
                    } icon: {
                        Text("See all")
                            .font(.custom("ProductSans-Regular", size: 18))
                            .foregroundColor(.black.opacity(0.7))
                    }

                }
                .padding(15)
                
                ForEach(0..<3) { i in
                    WalletRow(pos: i)
                }
                .padding(.horizontal, 10)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName:"line.3.horizontal.decrease")
                        .renderingMode(.template)
                        .foregroundColor(.blue)
                }
                ToolbarItem(placement: .principal) {
                    Text("Dashboard")
                        .font(.custom("ProductSans-Bold", size: 19))
                        .foregroundColor(.blue)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "person.crop.circle")
                        .renderingMode(.template)
                        .foregroundColor(.blue)
                }
            }
        }
    }
}
struct WalletRow: View {
    let currencies = ["₦", "$", "₵", "¥", "₿"]
    let amounts = ["486,216.35 NGN", "12.82 USD", "185.79 GHC",
                   "94,965.65 RMB", "0.0028915 BTC"]
    let type = ["Nigerian naira", "United States Dollar", "Ghana Cedis",
                "China Yuan Renminbi", "Bitcoin"]
    var pos: Int = 0
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.blue)
                .frame(maxWidth: 60)
                .frame(height: 60)
                .overlay {
                    Text(currencies[pos])
                        .font(.custom("ProductSans-Bold", size: 24))
                        .foregroundColor(.white)
                }
                .padding(10)
            VStack(alignment: .leading, spacing: 5) {
                Text(amounts[pos])
                    .font(.custom("ProductSans-Bold", size: 18))
                Text(type[pos])
                    .foregroundColor(.gray)
                    .font(.custom("ProductSans-Regular", size: 16))
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0.1))
        .overlay {
            RoundedRectangle(cornerRadius: 15)
                .stroke(.gray)
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
    let pos: Int
    let amounts = ["$59.56", "$86.06", "$96.09", "$32.46"]
    var isCard: Bool = false
    var body: some View {
        Button {
            //TODO: add action
        } label: {
            VStack(alignment: .center) {
                if(!isCard) {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color("subColor\(pos)"))
                        .frame(maxWidth: 45, maxHeight: 45)
                        .overlay {
                            Image("icon\(pos)")
                                .padding(4)
                                .foregroundColor(Color("Color\(pos)"))
                        }
                    Text(amounts[pos-1]).font(.custom("ProductSans-Bold", size: 20))
                        .foregroundColor(Color("Color\(pos)"))
                    Text(title).font(.custom("ProductSans-Regular", size: 16))
                        .foregroundColor(.black)
                }else {
                    Image("promo")
                        .resizable()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(isCard ? Color("Color\(pos)") : Color(.white))
            .mask(isCard ? RoundedCorner(radius: 30, corners: [.topLeft, .bottomRight]) : RoundedCorner())
            .overlay {
                if(!isCard) {
                    RoundedCorner(radius: 30, corners: [.topLeft, .bottomRight])
                        .stroke(Color("Color\(pos)"))
                }
            }
            //.padding(.leading, isCard ? 24 : 0)
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
