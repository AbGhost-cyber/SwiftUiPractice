//
//  StickyHeader.swift
//  swiftUiPractice
//
//  Created by dremobaba on 2023/1/19.
//

import SwiftUI

struct StickyTabView: View {
    var body: some View {
        TabView {
            StickyHeader()
                .tabItem {
                    Text("Home")
                    Image(systemName: <#T##String#>)
                }
        }
    }
}

struct StickyHeader: View {
    var titles = ["Last Week": 4, "Last Month": 5]
    var body: some View {
        NavigationStack {
            VStack(spacing:0) {
                ZStack {
                    Rectangle()
                        .fill(.pink.gradient)
                        .ignoresSafeArea(.all)
                    ScrollView {
                        HeaderView()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Text("Total balance")
                            .font(.custom("ProductSans-Regular", size: 15))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack(spacing: 2) {
                            Text("$")
                                .font(.custom("ProductSans-Bold", size: 25))
                                .foregroundColor(.white.opacity(0.7))
                            Text("2,432.57")
                                .font(.custom("ProductSans-Bold", size: 40))
                                .fontWeight(.semibold)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 1)
                    }
                    .padding()
                }
                .foregroundColor(.white)
                .frame(maxHeight: 190)
                ScrollView(showsIndicators: false) {
                    HStack {
                        Text("Recent")
                            .fontWeight(.thin)
                            .font(.custom("ProductSans-Regular", size: 18))
                        Spacer()
                        Button {
                            
                        } label: {
                            HStack {
                                Text("Show all")
                                    .fontWeight(.thin)
                                    .font(.custom("ProductSans-Regular", size: 18))
                                Image(systemName: "chevron.right")
                                    .font(.caption)
                            }
                            .foregroundColor(.pink)
                            .fontWeight(.semibold)
                        }

                    }
                    .padding([.leading, .trailing], 15)
                    .padding(.top, 30)
                    LazyVStack(alignment: .leading) {
                        ForEach(0..<2) { j in
                            Section {
                                VStack(alignment: .leading) {
                                    ForEach(0..<5) { i in
                                        RowItem()
                                        if i != 4 {
                                            Divider()
                                        }
                                    }
                                }
                                .padding([.top, .bottom])
                                .overlay {
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.gray, lineWidth: 0.2)
                                    
                                }
                            } header: {
                                Text(j == 1 ? "LAST MONTH": "LAST WEEK")
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                    .font(.custom("ProductSans-Regular", size: 18))
                                    .foregroundColor(.gray)
                                    .padding([.top, .bottom])
                            }
                        }
                        
                    }
                    .padding([.leading, .trailing])
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}


struct HeaderView: View {
    var body: some View {
        HStack(spacing: 20) {
            Text("Home")
                .font(.custom("ProductSans-Bold", size: 30))
            Spacer()
            Button {
                
            } label: {
                Circle()
                    .fill(.white.opacity(0.2))
                    .frame(width: 30)
                    .overlay {
                        Image(systemName: "arrow.up.right")
                    }
            }
            
            Button {
                
            } label: {
                Circle()
                    .fill(.white.opacity(0.2))
                    .frame(width: 30)
                    .overlay {
                        Image(systemName: "plus")
                    }
            }
            
            Button {
                
            } label: {
                Circle()
                    .fill(.white.opacity(0.2))
                    .frame(width: 30)
                    .overlay {
                        Image(systemName: "magnifyingglass")
                    }
            }
            
            Button {
                
            } label: {
                Circle()
                    .fill(.white.opacity(0.2))
                    .frame(width: 30)
                    .overlay {
                        Text("DP")
                            .font(.custom("ProductSans-Bold", size: 16))
                    }
            }
            
        }.foregroundColor(.white)
    }
}

struct RowItem: View {
    var body: some View {
        HStack {
            Image("uber")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 40)
            VStack(alignment: .leading) {
                Text("Uber")
                    .font(.custom("ProductSans-Bold", size: 18))
                    .fontWeight(.bold)
                Text("30, August")
                    .font(.custom("ProductSans-Regular", size: 13))
                    .foregroundColor(.secondary)
            }
            Spacer()
            HStack(spacing: 0) {
                Text("-$")
                    .font(.custom("ProductSans-Regular", size: 18))
                    .foregroundColor(.gray)
                Text("22.12")
                    .fontWeight(.thin)
                    .font(.custom("ProductSans-Regular", size: 18))
            }
        }
        .padding(.horizontal)
    }
}

struct StickyHeader_Previews: PreviewProvider {
    static var previews: some View {
        StickyHeader()
    }
}
