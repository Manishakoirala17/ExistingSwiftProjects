//
//  MyListsView.swift
//  ReminderApp
//
//  Created by Manisha on 30/09/23.
//

import SwiftUI
import SwiftData

struct MyListsView: View {
    @Environment(\.modelContext) var context
    
    @State var isPresented:Bool = false
    @State var editListItem:MyListViewModel
    
    var myLists:[MyListViewModel]
     
    var body: some View {
            ForEach(myLists,id: \.self){ list in
                
                NavigationLink(destination: ListRowDetailView(list:list)){
                    ListRow(list: list)
                }
                .swipeActions{
                        Button(role: .destructive) {
                            context.delete(list)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }

                    }
                    .swipeActions{
                        Button {
                            editListItem = list
                            isPresented = true
                        } label: {
                            Label("edit", systemImage: "info.circle.fill")
                        }

                    }

             }
            .sheet(isPresented:$isPresented){
                EditListView(listItem: editListItem ,isPresented:$isPresented)
            }
    }
}
struct ListRow:View {
    var list:MyListViewModel
    var body: some View {
        HStack(spacing:10){
                Image(systemName: "list.bullet.circle.fill")
                    .resizable()
                    .frame(width:30,height: 30)
                    .foregroundColor(stringToColor(color: list.color))
            Text(list.name)
        }
    }
}
#Preview {
    MyListsView(editListItem: MyListViewModel(name: "", color: ""), myLists: [])
}
