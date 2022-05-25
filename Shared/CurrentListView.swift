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
    
    @State private var collapsed: Bool = true
    @State private var addItemCollapsed: Bool = false
    
    var body: some View {
        NavigationView{
            VStack{
                List {
                    ForEach(items) { item in
                        VStack {
                            Button {
                                self.collapsed.toggle()
                            } label: {
                                HStack {
                                    Image(systemName: self.collapsed ? "chevron.right" : "chevron.down")
                                    Text(item.item ?? "Unknown Item")
                                    Spacer()
                                    Text("\(item.aisle)")
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 10).fill(.red).opacity(0.3))
                                }
                            }
                            
                            HStack {
                                Text(String(format: "$%.2f", item.price))
                                Text(String(format: "%.1f", item.quantity))
                                Spacer()
                            }
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: collapsed ? 0 : .none)
                            .clipped()
                            
                        }
                        
                    }
                    
                    
                    
                }
                Button {
                    self.addItemCollapsed.toggle()
                } label: {
                    HStack {
                        Text("Add Item")
                        Image(systemName: self.addItemCollapsed ? "chevron.right" : "chevron.down")
                        Spacer()
                    }
                }
                .foregroundColor(.red)
                .padding()

                if !addItemCollapsed {
                    AddItemView()
                }
                
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            .overlay(alignment: .bottomTrailing) {
                Button {
                    
                } label: {
                    Text("Save List")
                        .foregroundColor(.white)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.red))
                        .shadow(radius: 10)
                }
                .padding()
                
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
