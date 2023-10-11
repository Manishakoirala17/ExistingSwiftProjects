//
//  ReminderList.swift
//  ReminderApp
//
//  Created by Manisha on 09/10/23.
//

import SwiftUI
import SwiftData

struct ReminderList: View {
    @Query private var remindersList:[ReminderModelData]
    @Environment  (\.modelContext) var context
    var body: some View {
        List(remindersList,id: \.self){ item in
            VStack(alignment:.leading){
                Text("\(item.title)")
                Text("\(item.details.date)")
                Text("\(item.details.time)")
                
                if let list = item.list{
                    Text("\(list.name)")
                }
            }
            .swipeActions(allowsFullSwipe: false, content: {
                Button(role: .destructive,action:{
                    context.delete(item)
                }){
                    Text("Delete")
                }
            })
        }
    }
}

#Preview {
    ReminderList()
}
