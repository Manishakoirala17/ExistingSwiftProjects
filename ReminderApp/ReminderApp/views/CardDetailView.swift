//
//  CardDetailView.swift
//  ReminderApp
//
//  Created by Manisha on 12/10/23.
//

import SwiftUI

struct CardDetailView: View {
    @Binding var selectedItem:CardViewModel

    var body: some View {
        let title = selectedItem.title
        VStack{
            switch(title){
            case "Today":
                TodayReminders()
            case "Completed":
                CompletedReminders()
            case "Scheduled":
                ScheduledReminders()
            default:
                ReminderList()
            }

        }
    }
}
