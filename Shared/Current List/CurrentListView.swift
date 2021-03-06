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
    
    //@State private var collapsed: Bool = true
    @State private var addItemCollapsed: Bool = false
    
    
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Button {
                        
                    } label: {
                        Text("Save List")
                            .foregroundColor(.white)
                            .bold()
                            .padding(5)
                            .padding(.horizontal)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.red))
                            
                            
                    }
                    
                    Spacer()
                    
                    EditButton()
                        .foregroundColor(.black)
                }
                .padding(.horizontal)
                
                List {
                    ForEach(items) { item in
                        CurrentListRowView(listItems: item)

                    }
                    .onDelete(perform: deleteItem)
                }
                AddItemView()
                
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        
           
//            .sheet(isPresented: $showingAddScreen) {
//                AddItemView()
//            }
        }
        
    }
    
    func deleteItem(at offsets: IndexSet) {
        for offset in offsets {
            let item = items[offset]
            moc.delete(item)
        }
        try? moc.save()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentListView()
    }
}
