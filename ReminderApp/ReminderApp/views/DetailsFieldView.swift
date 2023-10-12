//
//  DetailsFieldView.swift
//  ReminderApp
//
//  Created by Manisha on 04/10/23.
//

import SwiftUI


struct DetailsFieldView: View {
//    enum priority : String, CaseIterable { // 1
//           case none
//           case low
//           case medium
//           case high
//       }
       
//    @State var selectedItem = priority.none// 2
    
    @State var date = Date.now
    @State var currentDate = Date.now
    
    @Binding var detailData:DetailsModel
    var body: some View {
        NavigationStack{
            List{
                Section{
                    HStack{
                        Image(systemName: "calendar")
                        Text("Date")
                        Toggle(" ", isOn: $detailData.isDate)
                    }
                    if(detailData.isDate){
                        DatePicker(
                            "Start Date",
                            selection: $detailData.date,
                            displayedComponents: [.date]
                        )
                        .datePickerStyle(.graphical)
                    }
                   

                    HStack{
                        Image(systemName: "clock")
                        Text("Time")
                        Toggle("", isOn: $detailData.isTime)
                    }
                    if(detailData.isTime){
                        DatePicker("Select time", selection: $detailData.time, displayedComponents: .hourAndMinute)
                            .labelsHidden()

                    }

                }
                Section{
                    HStack{
                        Image(systemName: "location.fill")
                        Text("Location")
                        Toggle("", isOn: .constant(true))
                    }
                }
                PrioritySection(priority: $detailData.priority )
//                Section{
//                    Picker("Priority", selection: $detailData.priority) {
//                        ForEach(priority, id: \.self) { item in
//                            Text(item)
//                        }
//                    }
//
//                }
               
            }
            .listStyle(.insetGrouped)
        }
        .navigationTitle("Details")
        .toolbar{
            ToolbarItem(placement:.confirmationAction){
                Button("Add"){
                    print("add")
                }
            }
        }
    }
}


struct PrioritySection:View {
    let priorities:[String] = ["none","low","medium","high"]

    @Binding var priority:String
    
    var body: some View {
        Section{
            Picker("Priority", selection: $priority) {
                ForEach(priorities, id: \.self) { item in
                    Text(item)
                }
            }

        }
    }
}
//#Preview {
//    DetailsFieldView(, detailData: <#Binding<DetailsModel>#>)
//}
