//
//  AddItemView.swift
//  GroceryListCoreData
//
//  Created by Andy Stefani on 5/24/22.
//

import SwiftUI

struct AddItemView: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var price = 0.0
    @State private var aisle = 0
    @State private var quantity = 1.0
    
    
    @State private var addItemCollapsed: Bool = false
    @State private var animationAmount = 2.0
    
    var body: some View {
        
        VStack{
            Button {
                self.addItemCollapsed.toggle()
                animationAmount += 1
               
            } label: {
                HStack {
                    Text("Add Item")
                    Spacer()
                    Image(systemName: self.addItemCollapsed ? "chevron.right" : "chevron.down")
                    
                }
                .foregroundColor(.red)
                .padding()
                
                
            }
            .padding(5)
            
            
            if !addItemCollapsed {
                VStack (alignment: .leading ) {
                    TextField("Name", text: $name)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                        .padding(.horizontal)
                    HStack {
                        Text("Price:")
                            .font(.caption)
                            .foregroundColor(.gray)
                        TextField("Price", value: $price, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                    .padding(.horizontal)
                    HStack {
                        Text("Quantity:")
                            .font(.caption)
                            .foregroundColor(.gray)
                        TextField("Quantity", value: $quantity, format: .number)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                    .padding(.horizontal)
                    HStack {
                        Text("Aisle:")
                            .font(.caption)
                            .foregroundColor(.gray)
                        TextField("Aisle", value: $aisle, format: .number)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                    .padding(.horizontal)
                if name == "" {
                    
                        Button {
                        } label: {
                            HStack{
                                Spacer()
                                Text("Add")
                                    .foregroundColor(.gray).opacity(0.2)
                                    
                                Spacer()
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                            .padding()
                        }

                    
                } else {
                        Button {
                            let newItem = ListItems(context: moc)
                            newItem.id = UUID()
                            newItem.item = name
                            newItem.price = price
                            newItem.aisle = Int64(aisle)
                            newItem.quantity = quantity
                            
                            try? moc.save()
                            dismiss()
                        } label: {
                            HStack{
                                Spacer()
                                Text("Add")
                                    .foregroundColor(.white)
                                    .bold()
                                Spacer()
                                 
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(.red))
                            .padding()
                        }

                }

                }
            }
        }
        .background(RoundedRectangle(cornerRadius: 10).fill(.red).opacity(0.2))
        .padding(.horizontal)
        .animation(.default, value: animationAmount)
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
    }
}
