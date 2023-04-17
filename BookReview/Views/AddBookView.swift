//
//  AddBookView.swift
//  BookReview
//
//  Created by Adelaida Gomez Vieco on 1/04/23.
//

import SwiftUI

struct RoundedTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.vertical)
            .padding(.horizontal, 24)
            .background(
                Color(UIColor.systemGray6)
            )
            .clipShape(Capsule(style: .continuous))
    }
}

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @FocusState private var keyboard: Bool
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        ZStack {
            Color.blueLight1
                .ignoresSafeArea(.all)
            VStack(spacing: 10) {
                Text("Add New Book")
                    .font(.largeTitle.bold())
                    .foregroundColor(.black)
                    .padding(.top, 20)
                TextField("Name of your book", text: $title)
                    .textFieldStyle(RoundedTextFieldStyle())
                    .padding(.horizontal, 25)
                    .focused($keyboard)
                
                TextField("Author's name", text: $author)
                    .textFieldStyle(RoundedTextFieldStyle())
                    .padding(.horizontal, 25)
                    .focused($keyboard)
                
                Text("Genre")
                    .font(.headline)
                    .foregroundColor(Color.black)
                VStack {
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.wheel)
                }
                VStack(spacing: 15) {
                    Text("Write a review")
                        .font(.headline)
                        .foregroundColor(.black)
                    TextEditor(text: $review)
                        .foregroundColor(.black)
                        .frame(width: 300, height: 200)
                        .cornerRadius(20)
                        .focused($keyboard)
                    
                    RaitingView(raiting: $rating)
                    
                    Button("Save") {
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.genre = genre
                        newBook.author = author
                        newBook.rating = Int16(rating)
                        newBook.review = review
                        
                        try? moc.save()
                        dismiss()
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 20)
                    .foregroundColor(.black)
                    .background(Color.pinkLight1)
                    .cornerRadius(8)
                }
            }//VStack
            .navigationTitle("Add Book")
//            .toolbar {
//                ToolbarItem(placement: .keyboard) {
//                    Button("Done")
//                    keyboard = false
//                }
//            }
//            Spacer()
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddBookView()
        }
    }
}
