//
//  ListRowDetailView.swift
//  ReminderApp
//
//  Created by Vignesh on 08/10/23.
//

import SwiftUI

struct ListRowDetailView: View {
    @State var isDetailPresented:Bool = false
    var color: Color = .orange
    var body: some View {
        VStack(alignment: .leading){
            Text("Reminders")
                .font(.largeTitle)
                .bold()
                .foregroundColor(color)
            List{
                VStack(alignment:.leading){
                    HStack{
                        HStack(spacing:0){
                            Image(systemName: "exclamationmark")
                            Image(systemName: "exclamationmark")
                            Image(systemName: "exclamationmark")
                        }
                        .foregroundColor(color)
                        TextField("",text: .constant("Test Reminder 1"),axis: .vertical)
                        Spacer()
                            Image(systemName: "info.circle")
                                .foregroundColor(color)
                                .onTapGesture {
                                    isDetailPresented = true
                                }
                        
                      
                    }
                    TextField("Add Note",text: .constant(""),axis: .vertical)
                    Text("Today 9.00 pm")
                        .foregroundColor(.red)
                }
            }
            .listStyle(.plain)
            Spacer()
            HStack{
                Image(systemName: "plus")
                Text("New Reminder")
                    .bold()
            }
            .foregroundColor(color)
            .padding()
          
        }
      
    }
}

#Preview {
    ListRowDetailView()
}
