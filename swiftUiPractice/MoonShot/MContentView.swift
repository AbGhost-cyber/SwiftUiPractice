//
//  MContentView.swift
//  swiftUiPractice
//
//  Created by dremobaba on 2023/1/3.
//

import SwiftUI

//struct User: Codable {
//    let name: String
//    let address: Address
//}
//
//struct Address: Codable {
//    let street: String
//    let city: String
//}


struct Mock: Identifiable {
    let id = UUID()
    let name: String
    let subText: String
    let image: String = "klu"
}

struct MContentView: View {
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach (help()) { mock in
                        NavigationLink {
                            Text("Detail view")
                        } label: {
                           MChildView(mock: mock)
                        }
                    }
                }
                .padding([.horizontal, .bottom], 5)
            }
            .navigationTitle("Demo")
        }
        
    }
    
    func help() -> [Mock] {
        return [
            Mock(name: "Apollo 1", subText: "Dec 23"),
            Mock(name: "Apollo 2", subText: "Dec 24"),
            Mock(name: "Apollo 1", subText: "Dec 23"),
            Mock(name: "Apollo 2", subText: "Dec 24"),
            Mock(name: "Apollo 1", subText: "Dec 23"),
            Mock(name: "Apollo 2", subText: "Dec 24"),
            Mock(name: "Apollo 1", subText: "Dec 23"),
            Mock(name: "Apollo 2", subText: "Dec 24"),
            Mock(name: "Apollo 1", subText: "Dec 23"),
            Mock(name: "Apollo 2", subText: "Dec 24"),
            Mock(name: "Apollo 1", subText: "Dec 23"),
            Mock(name: "Apollo 2", subText: "Dec 24"),
            Mock(name: "Apollo 1", subText: "Dec 23"),
            Mock(name: "Apollo 2", subText: "Dec 24"),
            Mock(name: "Apollo 1", subText: "Dec 23"),
            Mock(name: "Apollo 2", subText: "Dec 24"),
        ]
    }
}

struct MContentView_Previews: PreviewProvider {
    static var previews: some View {
        MContentView()
        
    }
}
