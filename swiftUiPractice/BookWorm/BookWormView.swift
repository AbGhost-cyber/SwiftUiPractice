//
//  BookWormView.swift
//  swiftUiPractice
//
//  Created by dremobaba on 2023/1/10.
//

import SwiftUI

struct BookWormView: View {
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>
    @Environment(\.managedObjectContext) var context
    @State private var showAddModal = false
    
    var body: some View {
        NavigationStack {
            Text("Count: \(books.count)")
                .font(.custom("ProductSans-Bold", size: 24))
                .navigationTitle("Bookworm")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showAddModal.toggle()
                        } label: {
                            Label("Add Book", systemImage: "plus")
                        }

                    }
                }
                .sheet(isPresented: $showAddModal) {
                    AddBookView()
                }
        }
    }
}
//struct PushButton: View {
//    let title: String
//    @Binding var isOn: Bool
//
//    var onColors = [Color.red, Color.yellow]
//    var offColors = [Color(white: 0.6), Color(white: 0.4)]
//
//    var body: some View {
//        Button(title) {
//            isOn.toggle()
//        }
//        .padding()
//        .background(LinearGradient(gradient: Gradient(colors: isOn ? onColors : offColors), startPoint: .top, endPoint: .bottom))
//        .foregroundColor(.white)
//        .clipShape(Capsule())
//        .shadow(radius: isOn ? 0 : 5)
//    }
//}
struct BookWormView_Previews: PreviewProvider {
    @StateObject static var dataController = DataController()
    static var previews: some View {
        NavigationStack {
            BookWormView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
