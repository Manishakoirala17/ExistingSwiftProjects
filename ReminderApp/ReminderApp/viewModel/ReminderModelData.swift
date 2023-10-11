//
//  ReminderModelData.swift
//  ReminderApp
//
//  Created by Manisha on 09/10/23.
//

import Foundation
import SwiftData

@Model
class ReminderModelData {
    var id:UUID
    var title:String
    var notes:String
    var details:Details
    
    var list:MyListViewModel?
    
    init(id: UUID, title: String, notes: String,details:Details) {
        self.id = id
        self.title = title
        self.notes = notes
        self.details = details
    }
}

@Model
class Details{
    var date:String
    var time:String
    var priority:String
    var repeatType:String
    
    init(date: String, time: String, priority: String, repeatType: String) {
        self.date = date
        self.time = time
        self.priority = priority
        self.repeatType = repeatType
    }
}

