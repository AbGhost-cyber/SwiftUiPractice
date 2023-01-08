//
//  PracticeView.swift
//  swiftUiPractice
//
//  Created by dremobaba on 2023/1/8.
//

import SwiftUI

struct PracticeView: View {
    @State private var selectedIndex: Int = 0
    private let categories = ["All", "Chair", "Sofa", "Lamp", "Kitchen", "Table"]
    private let collections = ["Popular", "Best", "Classics"]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(#colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1))
                    .ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        AppBarView()
                        TagLineView()
                            .padding(20)
                        SearchAndScanView()
                        
                        //MARK: categories
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(categories, id: \.self) { item in
                                    let index = categories.firstIndex(of: item)!
                                    Button(action: {
                                        selectedIndex = index
                                    }) {
                                        CategoryView(isActive: selectedIndex == index, text: categories[index])
                                    }
                                }
                            }
                            .padding()
                        }
                        ForEach(collections, id: \.self) { item in
                            ProductsView(text: item)
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    //    init(){
    //        for family in UIFont.familyNames {
    //             print(family)
    //
    //             for names in UIFont.fontNames(forFamilyName: family){
    //             print("== \(names)")
    //             }
    //        }
    //    }
    
}
struct ProductsView: View {
    let text: String
    var body: some View {
        NavigationStack {
            Text(text)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.custom("ProductSans-Bold", size: 24))
                .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(0..<4) { i in
                        Button(action: {}) {
                            ProductCardView(image: Image("chair_\(i+1)"), width: 210)
                        }
                    }
                    .padding(.leading)
                }
            }
            .padding(.bottom)
        }
    }
}

struct ProductCardView: View {
    let image: Image
    let width: CGFloat
    
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: width, height: 200 * (width/210))
                .cornerRadius(20)
            Text("Luxury Swedian chair")
                .font(.custom("ProductSans-Bold", size: 18))
                .foregroundColor(.black)
            
            HStack(spacing: 2) {
                ForEach(0..<5) { i in
                    Image(systemName: "star.fill")
                        .renderingMode(.template)
                        .foregroundColor(.yellow)
                }
                Spacer()
                Text("$1299")
                    .font(.custom("ProductSans-Bold", size: 18))
                    .foregroundColor(.black)
            }
        }
        .frame(width: width)
        .padding()
        .background(Color.white)
        .cornerRadius(20)
    }
}

struct SearchAndScanView: View {
    @State private var search: String = ""
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding(.trailing, 8)
                TextField("Search Furnitures", text: $search)
                    .font(.custom("ProductSans-Regular", size: 18))
            }
            .padding(.all, 20)
            .background(Color.white)
            .cornerRadius(10)
            .padding(.trailing, 8)
            
            Button(action: {}) {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.brown)
                    .frame(maxWidth: 70)
                    .overlay {
                        Image(systemName: "qrcode.viewfinder")
                            .renderingMode(.template)
                            .foregroundColor(.white)
                            .imageScale(.large)
                    }
            }
        }
        .padding()
    }
}
struct CategoryView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(text)
                .font(.custom("ProductSans-Regular", size: 18))
            
                .foregroundColor(isActive ? Color.brown : Color.black.opacity(0.5))
            if(isActive) {
                Color.brown
                    .frame(height: 4)
                    .clipShape(Capsule())
                    .padding(.top, 3)
            }
        }
        .padding()
    }
}
struct AppBarView: View {
    var body: some View {
        HStack {
//            Button(action: {}) {
//                Image("menu")
//                    .padding()
//                    .background(Color.white)
//                    .cornerRadius(10)
//            }
            Button(action: {}) {
                Image("menu")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
            }
            Spacer()
            
            Button(action: {}) {
                Image("Profile")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 42,height: 42)
                    .cornerRadius(10)
            }
        }
        .padding(.horizontal)
    }
}
//== ProductSans-Regular
//== ProductSans-Bold
struct TagLineView: View {
    var body: some View {
        Text("Find the \nBest ")
            .font(.custom("ProductSans-Regular", size: 32))
            .foregroundColor(Color.brown)
        + Text("Furniture!")
            .font(.custom("ProductSans-Bold", size: 32))
            .fontWeight(.bold)
            .foregroundColor(Color.brown)
    }
}

struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeView()
    }
}
