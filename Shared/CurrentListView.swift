//
//  ContentView.swift
//  Shared
//
//  Created by Andy Stefani on 5/20/22.
//

import SwiftUI

struct CurrentListView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    // make new fetch request with no sorting
    // put this in All List View
    @FetchRequest(sortDescriptors: []) var items: FetchedResults<ListItems>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView{
            VStack{
                List {
                    ForEach(items) { item in
                        HStack {
                            Text(item.item ?? "Unknown Item")
                            Spacer()
                            Text("\(item.aisle)")
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(.red))
                        }
                    }
                }
                
                AddItemView()
                
            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button {
//                        showingAddScreen.toggle()
//                    } label: {
//                        Label("Add Item", systemImage: "plus")
//                    }
//
//                }
//            }
//            .sheet(isPresented: $showingAddScreen) {
//                AddItemView()
//            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentListView()
    }
}
