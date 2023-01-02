//
//  HomeView.swift
//  swiftUiPractice
//
//  Created by dremobaba on 2023/1/1.
//

import SwiftUI

struct HomeView: View {
    var randomData = Item.allItems()
    
    init () {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    var body: some View {
        NavigationView {
            VStack{
                List {
                    ForEach(Item.allItems(), id: \.id){ item in
                        NoteItemView(item: item)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0.1, trailing: 0))
                    }
                    .onMove { IndexSet, offset in
                        
                    }
                    .onDelete { indexSet in
                        
                    }
                }
                .listStyle(.plain)
            }
           
            .navigationTitle("My Notes")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}
