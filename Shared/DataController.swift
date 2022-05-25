//
//  DataController.swift
//  GroceryListCoreData
//
//  Created by Andy Stefani on 5/20/22.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    // Core Data Type responsible for loading a data model and giving us access to the data inside
    let container = NSPersistentContainer(name: "GroceryListCoreData")
    
    // loads data immediately
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
