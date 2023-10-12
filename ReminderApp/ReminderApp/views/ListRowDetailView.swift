//
//  ListRowDetailView.swift
//  ReminderApp
//
//  Created by Vignesh on 08/10/23.
//

import SwiftUI
import SwiftData

struct ListRowDetailView: View {
    @Query var myReminders:[ReminderModelData]
    
    var list:MyListViewModel
    
    init(list: MyListViewModel) {
        self.list = list
        let listName = list.name
        let filter = #Predicate<ReminderModelData> { reminder in
            reminder.list?.name == listName
        }
        let query = Query(filter: filter)
        _myReminders = query
    }

    var color: Color = .orange
    var body: some View {
        let color = stringToColor(color: list.color)
        NavigationStack{
            VStack(alignment: .leading,spacing: 0){
                Text("\(list.name)")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(color)
                reminders(color: color, myReminders: myReminders,selectedList:list)
                Spacer()
                Button(action:{
                    print("new")
                }){
                    HStack{
                        Image(systemName: "plus")
                        Text("New Reminder")
                            .bold()
                    }
                    .foregroundColor(color)
                    .padding()
                }
            }
            .background(.gray.opacity(0.1))
        }
       

    }
}
struct reminders:View {
    var color: Color
    var myReminders:[ReminderModelData]
    var selectedList:MyListViewModel
    
    @Environment(\.modelContext) var context

    var body: some View {
        List{
            ForEach(myReminders,id:\.self){ reminder in
                reminderRow(reminder: reminder, selectedReminder: reminder, color: color,selectedList:selectedList)
                    .swipeActions{
                        Button(role: .destructive, action: {
                            context.delete(reminder)
                        }){
                            Text("Delete")
                        }
                    }
                    .swipeActions{
                        Button(action:{
                            
                        }){
                            Text("Detail")
                            
                        }
                    }
            }
            .listStyle(.plain)
        }
    }
}
struct reminderRow:View {
    @State var isDetailPresented:Bool = false
    @State var reminder:ReminderModelData
    
    @State var selectedReminder:ReminderModelData
    
    var color: Color
    var selectedList:MyListViewModel

    var body: some View {

        VStack(alignment:.leading){
            HStack{
                HStack(spacing:0){
                    ForEach(0..<getCount(value: reminder.details.priority),id: \.self){ _ in
                        Image(systemName: "exclamationmark")

                    }
                }
                .onAppear(){
                }
                .foregroundColor(color)
                TextField("",text: $reminder.title,axis: .vertical)
                Spacer()
                    Image(systemName: "info.circle")
                        .foregroundColor(color)
                        .onTapGesture {
                            isDetailPresented = true
                        }
                
              
            }
            TextField("Add Note",text: $reminder.notes,axis: .vertical)
            Text("\(reminder.details.date) \(reminder.details.time)")
                .foregroundColor(color)
            
        }
        .sheet(isPresented: $isDetailPresented, content:{
            DetailFormView(isPresented: $isDetailPresented,selectedReminder: selectedReminder,selectedList:selectedList)
        } )

    }
    func getCount(value:String) -> Int{
        switch(value){
        case "low":
             return 1
        case "medium":
            return 2
        case "high":
            return 3
        default:
            return 0
       }

    }
}
#Preview {
    ListRowDetailView(list: MyListViewModel(name: "", color: ""))
}

