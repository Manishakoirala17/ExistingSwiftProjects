//
//  MyListsView.swift
//  ReminderApp
//
//  Created by Manisha on 30/09/23.
//

import SwiftUI
import SwiftData

struct MyListsView: View {
    
    @Query private var myLists:[MyListViewModel]
    @Environment(\.modelContext) var context
    @State var isPresented:Bool = false
    @State var item:MyListModel = MyListModel.emptyModel
    
    var body: some View {
            ForEach(myLists,id: \.self){ list in
                ListRow(list: list)
                    .swipeActions{
                        Button(role: .destructive) {
                            context.delete(list)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }

                    }
                    .swipeActions{
                        Button {
                            item = MyListModel(name: list.name, color: stringToColor(color: list.color))
                            isPresented = true
                        } label: {
                            Label("edit", systemImage: "info.circle.fill")
                        }

                    }

             }
            .sheet(isPresented:$isPresented){
                EditListView(listItem: item,isPresented:$isPresented)
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
            Spacer()
            Image(systemName: "chevron.forward")
        }
    }
}
#Preview {
    MyListsView()
}
