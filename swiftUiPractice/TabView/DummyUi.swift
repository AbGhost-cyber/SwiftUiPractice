//
//  DummyUi.swift
//  swiftUiPractice
//
//  Created by dremobaba on 2022/12/30.
//

import SwiftUI
import SwiftUIFontIcon

struct DummyUi: View {
    
    
    var body: some View {
        TabView {
           HomeView()
            .tabItem {
                Label("Home", systemImage: "house")
            }
            
            Text("Discover")
                .tabItem {
                    Label("Discover", systemImage: "magnifyingglass")
                }
            Text("Create")
                .tabItem {
                    Label("Create", systemImage: "plus")
                }
            Text("Library")
                .tabItem {
                    Text("Library")
                    Image(systemName: "books.vertical")
                        .renderingMode(.template)
                }
            Text("Inbox")
                .tabItem {
                    Label("Inbox", systemImage: "text.bubble")
                        .background(Color.white)
                }
        }
        .tint(.white)
        .onAppear() {
            UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        }
    }
}



struct DummyUi_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DummyUi()
                .preferredColorScheme(.dark)
        }
    }
}
