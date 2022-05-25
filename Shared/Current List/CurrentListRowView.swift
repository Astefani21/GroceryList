//
//  CurrentListRowView.swift
//  GroceryListCoreData
//
//  Created by Andy Stefani on 5/25/22.
//

import SwiftUI

struct CurrentListRowView: View {
    
    @State private var collapsed: Bool = true
    @State var listItems: ListItems
    
    var body: some View {
        VStack {
            Button {
                self.collapsed.toggle()
                
            } label: {
                HStack {
                    Image(systemName: self.collapsed ? "chevron.right" : "chevron.down")
                    Text(listItems.item ?? "")
                    Spacer()
                    VStack{

                        Text(String(format: "%.f", listItems.quantity))
                            .padding()
                            .overlay(alignment:.top ) {
                                Text("Qty.")
                                    .font(.caption2)
                                    .foregroundColor(.gray)
                            }
                            .padding(.top,2)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray).opacity(0.2))
                         
                    }
                }
            }
            
            HStack {
                HStack {
                    Text("Price:")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(String(format: "$%.2f", listItems.price))
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(.gray).opacity(0.2))
                
                HStack {
                    
                    HStack {
                        Text("Aisle:")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text("\(listItems.aisle)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray).opacity(0.2))
                    
                }
                
                Spacer()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: collapsed ? 0 : .none)
            .clipped()
            
        }

    }
}

//struct CurrentListRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        CurrentListRowView(listItems: .constant(ListItems()))
//    }
//}
