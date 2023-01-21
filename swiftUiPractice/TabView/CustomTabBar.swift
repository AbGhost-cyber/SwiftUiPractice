//
//  CustomTabBar.swift
//  swiftUiPractice
//
//  Created by dremobaba on 2023/1/21.
//

import SwiftUI
import OrderedCollections

struct CustomTabBar: View {
    let icons: OrderedDictionary = ["house": "Home", "creditcard" : "Cards", "chart.pie":"Reports", "gearshape": "Settings"]
    @State var selectedIcon = ""
    var body: some View {
        VStack {
            ZStack {
                switch selectedIcon {
                case "house":
                    NavigationStack {
                        StickyHeader()
                    }
                case "creditcard", "chart.pie", "gearshape":
                    NavigationStack {
                        Text("Hello")
                            .navigationTitle("\(icons[selectedIcon]!)")
                    }
                default:
                    Text("Settings")
                }
            }
            Spacer()
            Divider()
            HStack {
                ForEach(Array(icons.keys), id: \.self) { icon in
                    Spacer()
                    Button {
                        selectedIcon = icon
                    } label: {
                        VStack {
                            let selected = selectedIcon == icon
                            Image(systemName: selected ? "\(icon).fill": icon)
                                .font(.system(size: 25))
                                .foregroundColor(selected ? .pink : Color(UIColor.lightGray))
                            Text(icons[icon]!)
                                .foregroundColor(selected ? .pink : Color(UIColor.lightGray))
                                .font(.custom("ProductSans-Regular", size: 16))
                                .fontWeight(.thin)
                        }
                    }
                    Spacer()
                }
            }
            .onAppear {
                if let first = icons.keys.first {
                    selectedIcon = first
                }
            }
            .padding(.top, 5)
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
    }
}
