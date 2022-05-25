//
//  AllListsView.swift
//  GroceryListCoreData
//
//  Created by Andy Stefani on 5/25/22.
//

import SwiftUI

struct AllListsView: View {
    var body: some View {
        VStack {
            Text("Previous Lists")
            
            Spacer()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct AllListsView_Previews: PreviewProvider {
    static var previews: some View {
        AllListsView()
    }
}
