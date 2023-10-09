//
//  DetailsFieldView.swift
//  ReminderApp
//
//  Created by Manisha on 04/10/23.
//

import SwiftUI

struct DetailsFieldView: View {
    enum priority : String, CaseIterable { // 1
           case none
           case low
           case medium
           case high
       }
       
    @State var selectedItem = priority.none// 2
    @State var date = Date.now
    @State var currentDate = Date.now
    var body: some View {
        NavigationStack{
            List{
                Section{
                    HStack{
                        Image(systemName: "calendar")
                        Text("Date")
                        Toggle("", isOn: .constant(true))
                    }
                    DatePicker(
                        "Start Date",
                        selection: $date,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.graphical)

                    HStack{
                        Image(systemName: "clock")
                        Text("Time")
                        Toggle("", isOn: .constant(true))
                    }
                    DatePicker("", selection: $currentDate, displayedComponents: .hourAndMinute)
                        .labelsHidden()


                }
                Section{
                    HStack{
                        Image(systemName: "location.fill")
                        Text("Location")
                        Toggle("", isOn: .constant(true))
                    }
                }
                Section{
                    Picker("Priority", selection: $selectedItem) {
                        ForEach(priority.allCases, id: \.self) { item in
                            Text(item.rawValue.capitalized)
                        }
                    }

                }
               
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

#Preview {
    DetailsFieldView()
}
