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
    
    
    
    
    var body: some View {
        //NavigationView{
            Form{
                //Section{
                    TextField("Name", text: $name)
                    HStack {
                        Text("Price:")
                            .font(.caption)
                            .foregroundColor(.gray)
                        TextField("Price", value: $price, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    }
                    HStack {
                        Text("Quantity:")
                            .font(.caption)
                            .foregroundColor(.gray)
                        TextField("Quantity", value: $quantity, format: .number)
                    }
                    HStack {
                        Text("Aisle:")
                            .font(.caption)
                            .foregroundColor(.gray)
                        TextField("Aisle", value: $aisle, format: .number)
                    }
                //}
                if name == "" {
                    Section{
                        Button {
                        } label: {
                            HStack{
                                Spacer()
                                Text("Add Item")
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                        }

                    }
                } else {
                    Section{
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
                                Text("Add Item")
                                    .foregroundColor(.red)
                                    .bold()
                                Spacer()
                            }
                        }

                    }
                }
                
            }
        //}
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
    }
}
