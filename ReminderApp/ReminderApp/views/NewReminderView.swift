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
    @State var selectedList: MyListViewModel?
    
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
                            let date = getDate(date: reminderData.details.date )
                            print(date)
                            let time = getTime(date: reminderData.details.time )
                            print(time)
                            let detailModel = Details(date: date, time: time, priority: reminderData.details.priority, repeatType: reminderData.details.repeatType)
                            let model = ReminderModelData(id: UUID(), title: reminderData.title, notes: reminderData.notes, details: detailModel)
                            context.insert(model)
                            model.list = selectedList
                            selectedList?.reminders?.append(model)
                            isPresented = false
                        }
                    })
                }
        }
        
    }
    func getDate(date:Date) -> String{
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .full
        formatter.timeZone = TimeZone.current
        let result = formatter.string(from: Date())
        return result
    }
    func getTime(date:Date) -> String{
        let dateFormatter = DateFormatter()
         
        dateFormatter.dateFormat = "HH:mm:ss"
         
        let result = dateFormatter.string(from: date)
        return result
    }
}
struct ReminderInputs:View {
    @Binding var reminderData:ReminderData
    @Binding var selectedList:MyListViewModel?
    
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
