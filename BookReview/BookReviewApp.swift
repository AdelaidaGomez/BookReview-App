//
//  BookReviewApp.swift
//  BookReview
//
//  Created by Adelaida Gomez Vieco on 30/03/23.
//

import SwiftUI

@main
struct BookReviewApp: App {
    @State private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
