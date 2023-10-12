//
//  DashboardView.swift
//  ReminderApp
//
//  Created by Manisha on 30/09/23.
//

import SwiftUI
import SwiftData

struct DashboardView: View {
    @State var cardItems = CardViewModel()
    @State var addListPresented:Bool = false
    @State var search:String = ""
    @State var newReminderPresented:Bool = false
    @State private var goToNewView: Bool = false
    
    @Query private var myLists:[MyListViewModel]


    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationStack{
            VStack(alignment:.leading,spacing:0){
                List{
                    SearchBar(search: $search)
                        .listRowBackground(Color.gray.opacity(0.0))
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                    if cardItems.cards.count == 1{
                        let item = cardItems.cards[0]
                        HStack{
                            CardView(count: item.count, title: item.title, imageName: item.imageName, imageColor: item.color)
                                
                        }
                        .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                        .listRowBackground(Color.gray.opacity(0.0))
                        .listRowSeparator(.hidden)
                    }
                    else{
                        LazyVGrid(columns: columns) {
                            ForEach(cardItems.cards, id: \.self) { item in
                                CardView(count: item.count, title: item.title, imageName: item.imageName, imageColor: item.color)
                                    .onTapGesture {
                                        goToNewView = true
                                    }
                            }
                        }
                        .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                        .listRowBackground(Color.gray.opacity(0.0))
                        .listRowSeparator(.hidden)
                    }
                   
                   
                        Text("My Lists")
                            .font(.title)
                            .bold()
                            .listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                            .listRowBackground(Color.gray.opacity(0.0))
                            .listRowSeparator(.hidden)
                            .padding(6)
                    MyListsView(editListItem: MyListViewModel(name: "" , color: ""), myLists:myLists)
                    
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
                    NavigationLink(destination: EditDashboardView(), label: {
                        Text("Edit")
                    })
                }
            }
            .background(Color.gray.opacity(0.1))
            .sheet(isPresented:$addListPresented , content: {
                AddListView(isPresented: $addListPresented)
            })
            .sheet(isPresented:$newReminderPresented,content:{
                NewReminderView(reminderData: ReminderData.emptyModel, isPresented:$newReminderPresented)

            })
            .navigationDestination(isPresented:$goToNewView) {
                ReminderList()
            }
        }

    }
}

#Preview {
    DashboardView()
}
