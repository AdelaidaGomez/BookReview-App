//
//  DataController.swift
//  BookReview
//
//  Created by Adelaida Gomez Vieco on 30/03/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "BookReview")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data faild to load: \(error.localizedDescription)")
            }
        }
    }
}
