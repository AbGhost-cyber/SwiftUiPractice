//
//  DataController.swift
//  swiftUiPractice
//
//  Created by dremobaba on 2023/1/10.
// Day 31
//

import Foundation
import CoreData

class DataController: ObservableObject {
    //gives us access to the data inside this container
    let container: NSPersistentContainer
    static let shared: DataController = DataController()
    init() {
        container = NSPersistentContainer(name: "bookworm")
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
