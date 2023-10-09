//
//  ListRowDetailView.swift
//  ReminderApp
//
//  Created by Vignesh on 08/10/23.
//

import SwiftUI

struct ListRowDetailView: View {
    @State var isDetailPresented:Bool = false
    var body: some View {
        VStack(alignment: .leading){
            Text("Reminders")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.orange)
            List{
                VStack(alignment:.leading){
                    HStack{
                        HStack(spacing:0){
                            Image(systemName: "exclamationmark")
                            Image(systemName: "exclamationmark")
                            Image(systemName: "exclamationmark")
                        }
                        .foregroundColor(.orange)
                        TextField("",text: .constant("Test Reminder 1"),axis: .vertical)
                        Spacer()
                            Image(systemName: "info.circle")
                                .foregroundColor(.orange)
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
          
        }
      
    }
}

#Preview {
    ListRowDetailView()
}
