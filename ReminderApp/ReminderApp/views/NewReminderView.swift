//
//  NewReminderView.swift
//  ReminderApp
//
//  Created by Manisha on 03/10/23.
//

import SwiftUI

struct NewReminderView: View {
    @Environment(\.modelContext) var context
    
    @State var reminderData:ReminderData
    @State var selectedList: MyListViewModel = MyListViewModel(name: "", color: "")
    
    @Binding var isPresented:Bool
    
    var body: some View {
        NavigationStack{
            ReminderInputs(reminderData:$reminderData,selectedList:$selectedList)
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
                            let detailModel = Details(priority: reminderData.details.priority, repeatType: reminderData.details.repeatType,reminderDate: reminderData.details.date, reminderTime: reminderData.details.time)
                            let model = ReminderModelData(id: UUID(), title: reminderData.title, notes: reminderData.notes, details: detailModel)
                            context.insert(model)
                            model.list = selectedList
                            selectedList.reminders?.append(model)
                            isPresented = false
                        }
                    })
                }
        }
        
    }
  
}
struct ReminderInputs:View {
    @Binding var reminderData:ReminderData
    @Binding var selectedList:MyListViewModel
    
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
            Section{
                NavigationLink(destination: ListFieldView(listData: $selectedList)){
                    HStack{
                        Text("List")
                    }
                }
            }
        }
    }
}




//#Preview {
//    NewReminderView(isPresented: .constant(true))
//}
