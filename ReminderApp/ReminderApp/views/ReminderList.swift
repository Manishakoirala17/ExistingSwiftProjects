//
//  ReminderList.swift
//  ReminderApp
//
//  Created by Manisha on 09/10/23.
//

import SwiftUI
import SwiftData

struct ReminderList: View {
    @Query private var myLists:[ReminderModelData]
    var body: some View {
        List(myLists,id: \.self){ item in
            Text("\(item.title)")
        }
    }
}

#Preview {
    ReminderList()
}
