//
//  TodayReminders.swift
//  ReminderApp
//
//  Created by Manisha on 12/10/23.
//

import SwiftUI
import SwiftData

struct TodayReminders: View {
    @Query(filter: ReminderModelData.currentPredicate(),
           sort: \ReminderModelData.details.reminderDate
   ) var remindersList: [ReminderModelData]

    static func currentPredicate() -> Predicate<ReminderModelData> {
        let currentDate = Date.now

        return #Predicate<ReminderModelData> { reminder in
            reminder.details.reminderDate > currentDate
        }
    }

        @Environment  (\.modelContext) var context
        var body: some View {
            VStack(alignment: .leading,spacing: 2){
                Text("Today")
                    .font(.title)
                    .foregroundColor(.blue)
                    .bold()
                    .padding(.horizontal)
                
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
                .listStyle(.plain)
            }
            .background(.gray.opacity(0.1))
          
        }
    
}
//
//#Preview {
//    TodayReminders()
//}
