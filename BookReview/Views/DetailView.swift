//
//  DetailView.swift
//  BookReview
//
//  Created by Adelaida Gomez Vieco on 1/04/23.
//

import SwiftUI

struct DetailView: View {
    let book: Book
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var moc
    @State private var showingDeleteAlert = false
    
    var body: some View {
        ZStack {
            Color.grey1
                .ignoresSafeArea(.all)
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.blueLight1)
                    .frame(width: 430, height: 590)
                    .position(x: 215, y: 600)
                VStack(alignment: .leading) {
                    VStack(alignment: .center, spacing: 10) {
                        Image(book.genre ?? "noImage")
                            .resizable()
                            .frame(width: 300, height: 220)
                        Text(book.title ?? "Unknown Title")
                            .font(.title.bold())
                            .foregroundColor(.black)
                            .padding(.horizontal, 40)
                        Text(book.author ?? "Unknown Author")
                            .font(.headline)
                            .foregroundColor(.gray)
                        VStack(alignment: .center, spacing: 7) {
                            RaitingView(raiting: .constant(Int(book.rating)))
                            Text(book.review ?? "Unknown")
                                .padding(.horizontal, 30)
                        }
                        .padding()
                    }
                }
            }
        }
        .alert("Delete Book?", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Are you sure?")
        }
        .toolbar {
            Button {
                showingDeleteAlert = true
            } label: {
                Label("Delet this book", systemImage: "trash")
            }
        }
    }
    
    func deleteBook() {
        moc.delete(book)
        
        try? moc.save()
        dismiss()
    }
}


