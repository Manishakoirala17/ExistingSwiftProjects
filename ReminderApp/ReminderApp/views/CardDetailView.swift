//
//  CardDetailView.swift
//  ReminderApp
//
//  Created by Manisha on 12/10/23.
//

import SwiftUI

struct CardDetailView: View {
    @State var selectedItem:CardViewModel = CardViewModel(title: "", imageName: "", color: "", isSelected: false)

    var body: some View {
        Text("\(selectedItem.title)")
//        switch(selectedItem){
//        case "Today":
//            TodayReminders()
//        default:
//            ReminderList()
//        }
    }
}

#Preview {
    CardDetailView()
}
