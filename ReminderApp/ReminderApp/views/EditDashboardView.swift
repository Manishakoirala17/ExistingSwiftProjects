//
//  EditDashboardView.swift
//  ReminderApp
//
//  Created by Vignesh on 06/10/23.
//

import SwiftUI
import SwiftData

struct EditDashboardView: View {
    @Environment(\.presentationMode) var presentationMode

    @State var search = ""
    @State var isAddListPresented:Bool = false
    
    @Query private var cardItems:[CardViewModel]
    @Query var listItems:[MyListViewModel]

    var body: some View {
        NavigationView{
            VStack{
                List{
                    SearchBar(search: $search)
                        .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                        .listRowBackground(Color.gray.opacity(0.0))
                        .listRowSeparator(.hidden)
                    
                    Section{
                        ForEach(cardItems,id: \.self) { item in
                           CardRow(item: item)
                        }
                    }
                    Section(header:Text("My Lists").bold().font(.largeTitle).foregroundColor(.black))
                    {
                        ForEach(listItems,id:\.self) { item in
                           MyListRow(item: item)
                        }
                    }
                   
                }
                Spacer()
                HStack{
                    Text("Add Group")
                    Spacer()
                    Button(action:{
                        isAddListPresented = true
                    }){
                        Text("Add List")
                    }
                }
                .padding()
            }
            .background(Color.gray.opacity(0.1))
           
            .toolbar{
                ToolbarItem{
                    Button("Done")
                    {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .sheet(isPresented: $isAddListPresented, content:{
                AddListView(isPresented: $isAddListPresented)
            })
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

struct MyListRow:View {
    var item:MyListViewModel
    var body: some View {
        HStack{
            Image(systemName: "minus.circle.fill")
                .foregroundColor(.red)
            Image(systemName: "list.bullet.circle.fill")
                .resizable()
                .frame(width: 20,height: 20)
                .foregroundColor(CardViewModel[item.color])
            Text(item.name)
            Spacer()
            Image(systemName: "info.circle")
                .foregroundColor(.blue)
            Divider()
            Image(systemName: "line.horizontal.3")
                .foregroundColor(.gray)

        }
    }
}

struct CardRow:View {
    var item:CardViewModel
    var body: some View {
        HStack{
            Button(action:{
                item.isSelected = !item.isSelected
            }){
                if(item.isSelected){
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.blue)
                }
                else{
                    Image(systemName: "circle")

                }
            }
           
            Image(systemName: item.imageName)
                .resizable()
                .frame(width: 30,height: 30)
                .foregroundColor(CardViewModel[item.color])
            Text(item.title)
            Spacer()
            Image(systemName: "line.horizontal.3")
                .foregroundColor(.gray)

        }
    }
}

#Preview {
    EditDashboardView()
}
