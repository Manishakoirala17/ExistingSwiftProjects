//
//  DetailFormView.swift
//  ReminderApp
//
//  Created by Manisha on 11/10/23.
//

import SwiftUI

struct DetailFormView: View {
    @Binding var isPresented:Bool
    
    @State var title:String = ""
    @State var notes: String = ""
    @State var isDateToggle:Bool = false
    @State var isTimeToggle:Bool = false

    @State var selectedReminder:ReminderModelData
    
    @State var selectedList:MyListViewModel
    
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    Section{
                        TextField("Title",text: $selectedReminder.title)
                        TextField("Notes",text: $selectedReminder.notes,axis: .vertical)
                            .lineLimit(3, reservesSpace: true)

                    }
                    
                    DateTimeSection(dateToggle: $isDateToggle, date: $selectedReminder.details.reminderDate, timeToggle: $isTimeToggle, time: $selectedReminder.details.reminderTime)
                        .onAppear(perform: {
                            let d = selectedReminder.details.date
                            let t = selectedReminder.details.time

                            if (!d.isEmpty){
                                isDateToggle = true
                            }
                            if(!t.isEmpty){
                                isTimeToggle = true
                            }
                        
                        })
                    PrioritySection(priority: $selectedReminder.details.priority)
                    Section{
                        NavigationLink(destination: ListFieldView(listData: $selectedList)){
                            HStack{
                                Text("List")
                            }
                        }
                    }

                }
            }
            
            .background(.gray.opacity(0.1))
                .navigationTitle("Details")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement:.cancellationAction){
                        Button(action:{
                           
                            isPresented = false
                        }){
                            Text("Cancel")
                        }
                    }
                    ToolbarItem(placement:.confirmationAction){
                        Button(action:{
                            if var _ = selectedReminder.list{
                                selectedReminder.list = selectedList
                            }
                            isPresented = false
                        }){
                            Text("Done")
                        }
                    }
                }

        }
    }
}
struct DateTimeSection:View {
    @Binding var dateToggle:Bool
    @Binding var date:Date
    @Binding var timeToggle:Bool
    @Binding var time:Date
    
    var body: some View {
        Section{
            HStack{
                Image(systemName: "calendar")
                Text("Date")
                Toggle(" ", isOn: $dateToggle)
            }
            if(dateToggle){
                DatePicker(
                    "Start Date",
                    selection: $date,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
            }
           

            HStack{
                Image(systemName: "clock")
                Text("Time")
                Toggle("", isOn: $timeToggle)
            }
            if(timeToggle){
                DatePicker("Select time", selection: $time, displayedComponents: .hourAndMinute)
                    .labelsHidden()

            }

        }
    }
}


//#Preview {
//    DetailFormView(isPresented: .constant(true))
//}
