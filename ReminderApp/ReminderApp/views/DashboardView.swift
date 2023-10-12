//
//  DashboardView.swift
//  ReminderApp
//
//  Created by Manisha on 30/09/23.
//

import SwiftUI
import SwiftData

struct DashboardView: View {
    static var cardsList:[CardViewModel]{
             return [
                CardViewModel( title: "Today", imageName: "calendar.circle.fill", color: "blue", isSelected: true),
                CardViewModel( title: "Scheduled", imageName: "calendar.circle", color: "red", isSelected: true),
                CardViewModel( title: "All", imageName: "tray.circle.fill", color: "black", isSelected: true),
                CardViewModel( title: "Completed", imageName: "checkmark.circle.fill", color: "gray", isSelected: true)
            ]

    }
    
    @State var addListPresented:Bool = false
    @State var search:String = ""
    @State var newReminderPresented:Bool = false
    @State var goToNewView: Bool = false
    @State var count:Int = 0
    
    @Query private var myLists:[MyListViewModel]
    @Query private var cardItems:[CardViewModel]

    @Environment(\.modelContext) var context
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationView{
            VStack(alignment:.leading,spacing:0){
                List{
                    SearchBar(search: $search)
                        .listRowBackground(Color.gray.opacity(0.0))
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                
                        LazyVGrid(columns: columns) {
                            ForEach(cardItems, id: \.self) { item in
                                if (item.isSelected){
                                    CardView(count: count, title: item.title, imageName: item.imageName, imageColor: item.color)
                                        .background(
                                            NavigationLink(destination: CardDetailView(selectedItem:item), isActive: $goToNewView, label: {
                                                EmptyView()
                                            })
                                        )

                                }
                               
                            }
                        }
                        .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                        .listRowBackground(Color.gray.opacity(0.0))
                        .listRowSeparator(.hidden)
                    
                   
                   
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
        }
        .onAppear(){
            if cardItems.isEmpty{
                for card in CardViewModel.cardsList{
                    context.insert(card)
                }
            }
        }

    }
}


#Preview {
    DashboardView()
}
