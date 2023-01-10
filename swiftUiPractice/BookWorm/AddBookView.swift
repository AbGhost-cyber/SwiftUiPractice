//
//  AddBookView.swift
//  swiftUiPractice
//
//  Created by dremobaba on 2023/1/10.
//

import SwiftUI

struct AddBookState {
    var title = ""
    var author = ""
    var rating = 3
    var genre = ""
    var review = ""
}
struct AddBookView: View {
    @Environment(\.managedObjectContext) var context
    @Environment(\.dismiss) var dismiss
    
   @State private var state: AddBookState = AddBookState()
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name", text: $state.title)
                        .font(.custom("ProductSans-Regular", size: 18))
                    TextField("Author", text: $state.author)
                        .font(.custom("ProductSans-Regular", size: 18))
                    Picker("Genre", selection: $state.genre) {
                        ForEach(genres, id: \.self) { genre in
                            Text(genre)
                        }
                    }
                    .font(.custom("ProductSans-Regular", size: 18))
                }
                Section {
                    TextEditor(text: $state.review)
                        .font(.custom("ProductSans-Regular", size: 18))
                    Picker("Rating", selection: $state.rating) {
                        ForEach(0..<6) {
                            Text(String($0))
                        }
                    }
                } header: {
                    Text("Write a review")
                        .font(.custom("ProductSans-Regular", size: 15))
                }
                Section {
                    Button("Save") {
                       createNewBook()
                    }
                }
            }
            .navigationTitle("Add Book")
        }
    }
    
    func createNewBook()  {
        let newBook = Book(context: context)
        newBook.id = UUID()
        newBook.title = state.title
        newBook.author = state.author
        newBook.rating = Int16(state.rating)
        newBook.genre = state.genre
        newBook.review = state.review
        
        try? context.save()
        dismiss()
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
