//
//  NewReminderView.swift
//  ReminderApp
//
//  Created by Manisha on 03/10/23.
//

import SwiftUI

struct NewReminderView: View {
    @Binding var isPresented:Bool
    var body: some View {
        NavigationStack{
            ReminderInputs()
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
                            isPresented = false
                        }
                    })
                }
        }
    }
}
struct ReminderInputs:View {
    var body: some View {
        List{
            Section{
                TextField("Title",text: .constant(""))
                TextField("Notes",text: .constant(""),axis: .vertical)
                    .lineLimit(3, reservesSpace: true)

            }
            Section{
                HStack{
                    Text("Details")
                    Spacer()
                    Image(systemName: "chevron.right")
                }
            }
            Section{
                HStack{
                    Text("List")
                    Spacer()
                    Image(systemName: "chevron.right")
                }
            }
        }
    }
}
#Preview {
    NewReminderView(isPresented: .constant(true))
}
