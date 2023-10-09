//
//  NewReminderView.swift
//  ReminderApp
//
//  Created by Manisha on 03/10/23.
//

import SwiftUI

struct NewReminderView: View {
    @Environment(\.modelContext) var context
    
    @State var reminderData:ReminderData = ReminderData()
    @Binding var isPresented:Bool
    var body: some View {
        NavigationStack{
            ReminderInputs(reminderData:$reminderData)
                .navigationTitle("New Reminder")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .cancellationAction, content: {
                        Button("Cancel"){
                            isPresented = false
                        }
                    })

                    ToolbarItem(placement: .confirmationAction, content: {
                        Button("Done"){
                            let model = ReminderModelData(id: UUID(), title: reminderData.title, notes: reminderData.notes, details: Details(date: reminderData.details.date, time: reminderData.details.time, priority: reminderData.details.priority, repeatType: reminderData.details.repeatType))
                            context.insert(model)
                            isPresented = false
                        }
                    })
                }
        }
    }
}
struct ReminderInputs:View {
    @Binding var reminderData:ReminderData
    
    var body: some View {
        List{
            Section{
                TextField("Title",text: $reminderData.title)
                TextField("Notes",text: $reminderData.notes,axis: .vertical)
                    .lineLimit(3, reservesSpace: true)

            }
            Section{
                NavigationLink(destination: DetailsFieldView(detailData: $reminderData.details)){
                    HStack{
                        Text("Details")
                    }
                }
               
            }
//            Section{
//                NavigationLink(destination: ListFieldView(listData: $reminderData.list)){
//                    HStack{
//                        Text("List")
//                    }
//                }
//            }
        }
    }
}
#Preview {
    NewReminderView(isPresented: .constant(true))
}
