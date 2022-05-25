//
//  ListView.swift
//  GroceryListCoreData
//
//  Created by Andy Stefani on 5/24/22.
//

import SwiftUI

struct ListView: View {
    
    // note which list is selected for toggle
    @State private var listSelected = 0
    
    var body: some View {
        
        NavigationView{
            VStack {
                Picker("Choose Your List", selection: $listSelected) {
                    Text("Current List").tag(0)
                    Text("All Lists").tag(1)
                }
                .pickerStyle(.segmented)
                
                
                if listSelected == 0 {
                    
                    CurrentListView()
                    
                } else if listSelected != 0 {
                    
                    CurrentListView()
                }
            }.navigationTitle("")
                .navigationBarHidden(true)
        }

    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
