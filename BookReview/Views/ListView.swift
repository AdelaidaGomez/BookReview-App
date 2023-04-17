//
//  ListView.swift
//  BookReview
//
//  Created by Adelaida Gomez Vieco on 30/03/23.
//

import SwiftUI

struct ListView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>
    
    @State private var showingAddScreen = false
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 25) {
                Button{
                    showingAddScreen.toggle()
                } label: {
                    Text("❒ Add New Book")
                        .foregroundColor(.black)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 20)
                .foregroundColor(.black)
                .background(Color.pinkLight1)
                .cornerRadius(8)
                .padding(.top, 30)
                .sheet(isPresented: $showingAddScreen) {
                    AddBookView()
                }
                
                if #available(iOS 16.0, *) {
                    List {
                        Section {
                            ForEach(books) { book in
                                NavigationLink {
                                    DetailView(book: book)
                                } label: {
                                    HStack(spacing: 20) {
                                            Image(systemName: "book")
                                                .resizable()
                                                .frame(width: 50, height: 40)
                                            VStack(alignment: .leading, spacing: 7) {
                                                Text(book.title ?? "Unknown")
                                                    .font(.title3.bold())
                                                    .foregroundColor(.black)
                                                Text(book.author ?? "Unknown")
                                                    .font(.headline)
                                                    .foregroundColor(.gray)
                                                RaitingView(raiting: .constant(Int(book.rating)))
                                                    .font(.caption)
                                            }
                                        }
                                }
                            }
                            .onDelete(perform: deleteBook)
                        } header: {
                            Text("Your Books")
                                .foregroundColor(.black)
                        }
                        .listRowSeparator(.hidden)
                        .listRowBackground(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.blueLight1.opacity(0.35))
                                .padding(.vertical, 7)
                                .padding(.horizontal, 8)

                        )
                    }
                    .scrollContentBackground(.hidden)
                } else {
                    // Fallback on earlier versions
                }
            }
        }
        .navigationTitle("Books")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
        }
        .background {
            Color.grey1
                .ignoresSafeArea()
        }
    }
    
    func deleteBook(at offSets: IndexSet) {
        for offSet in offSets {
            let book = books[offSet]
            moc.delete(book)
        }
        
        try? moc.save()
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}
