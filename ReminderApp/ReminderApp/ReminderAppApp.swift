//
//  ReminderAppApp.swift
//  ReminderApp
//
//  Created by Manisha on 30/09/23.
//

import SwiftUI
import SwiftData

@main
struct ReminderAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [MyListViewModel.self,ReminderModelData.self,CardViewModel.self])
    }
}
