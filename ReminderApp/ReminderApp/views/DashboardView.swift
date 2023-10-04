//
//  DashboardView.swift
//  ReminderApp
//
//  Created by Manisha on 30/09/23.
//

import SwiftUI

struct DashboardView: View {
    var cardItems:[CardDataModel] = CardDataModel.all()
    @State var addListPresented:Bool = false
    @State var search:String = ""
    @State var newReminderPresented:Bool = false
    var body: some View {
        NavigationStack{
            VStack(alignment:.leading,spacing:0){
                List{
                    SearchBar(search: $search)
                        .listRowBackground(Color.gray.opacity(0.0))
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))

                    HStack
                    {
                            CardView(count: cardItems[0].count, title: cardItems[0].title, imageName: cardItems[0].imageName, imageColor: cardItems[0].color)
                            CardView(count: cardItems[1].count, title: cardItems[1].title, imageName: cardItems[1].imageName, imageColor: cardItems[1].color)
                    }
                    .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                    .listRowBackground(Color.gray.opacity(0.0))
                    .listRowSeparator(.hidden)
                    HStack{
                        CardView(count: cardItems[2].count, title: cardItems[2].title, imageName: cardItems[2].imageName, imageColor: cardItems[2].color)
                        CardView(count: cardItems[3].count, title: cardItems[3].title, imageName: cardItems[3].imageName, imageColor: cardItems[3].color)
                    }
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(Color.gray.opacity(0.0))
                    .listRowSeparator(.hidden)
                        Text("My Lists")
                            .font(.title)
                            .bold()
                            .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                            .listRowBackground(Color.gray.opacity(0.0))
                            .listRowSeparator(.hidden)
                        MyListsView()
                }
                .listStyle(.insetGrouped)
                Spacer()
                HStack{
                    Button(action: {
                        newReminderPresented = true
                    }, label: {
                        HStack{
                            Image(systemName: "plus")
                            Text("New Reminder")
                                .bold()
                        }
                    })
                    Spacer()
                    Button(action: {addListPresented = true}, label: {
                            Text("Add List")
                    })
                    
                }
                .padding()
            }
            .toolbar{
                ToolbarItem{
                    Button("Edit"){
                        print("edit")
                    }
                }
            }
            .background(Color.gray.opacity(0.1))
            .sheet(isPresented:$addListPresented , content: {
                AddListView(isPresented: $addListPresented)
            })
            .sheet(isPresented:$newReminderPresented,content:{
                NewReminderView(isPresented:$newReminderPresented)

            })
        }
    
    }
}

#Preview {
    DashboardView()
}
