//
//  BookWormView.swift
//  swiftUiPractice
//
//  Created by dremobaba on 2023/1/10.
//

import SwiftUI

struct BookWormView: View {
    @FetchRequest(sortDescriptors: [SortDescriptor(\.title), SortDescriptor(\.author)]) var books: FetchedResults<Book>
    @Environment(\.managedObjectContext) var context
    @State private var showAddModal = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    NavigationLink {
                        DetailView(book: book)
                            .environment(\.managedObjectContext, context)
                    } label: {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                            VStack(alignment: .leading) {
                                Text(book.title ?? "Unknown Title")
                                    .font(.custom("ProductSans-Bold", size: 20))
                                Text(book.author ?? "Unknown Author")
                                    .foregroundColor(.secondary)
                                    .font(.custom("ProductSans-Regular", size: 17))
                            }
                        }
                    }
                    
                }
                .onDelete(perform: deleteBooks)
            }
            .navigationTitle("Bookworm")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddModal.toggle()
                    } label: {
                        Label("Add Book", systemImage: "plus")
                    }
                    
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showAddModal) {
                AddBookView()
            }
        }
    }
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            context.delete(book)
        }
        try? context.save()
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
    @StateObject static var dataController = DataController.shared
    static var previews: some View {
        NavigationStack {
            BookWormView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
