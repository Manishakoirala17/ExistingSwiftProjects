//
//  MyListViewModel.swift
//  ReminderApp
//
//  Created by Manisha on 02/10/23.
//

import Foundation
import SwiftData

@Model
class MyListViewModel{
    var name:String
    var color:String
    
    @Relationship(deleteRule: .cascade, inverse: \ReminderModelData.list)
    var reminders:[ReminderModelData]?
    
    init(name: String,color:String) {
        self.name = name
        self.color = color
    }
}

