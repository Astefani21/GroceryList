//
//  GroceryListCoreDataApp.swift
//  Shared
//
//  Created by Andy Stefani on 5/20/22.
//

import SwiftUI

@main
struct GroceryListCoreDataApp: App {
    
    // allows data to stay live the whole time instead of recreating store of data every view
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ListView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
            // managedObjectContext is the live data when you change, delete, etc., works with data in memory
        
            //view context is to let us work with all our data in memory, which is much faster than constantly reading and writing data to disk
        }
    }
}
