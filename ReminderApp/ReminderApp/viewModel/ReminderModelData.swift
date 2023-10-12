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
    var date:String = ""
    var time:String = ""
    var priority:String
    var repeatType:String
    var reminderDate:Date = Date()
    var reminderTime:Date = Date()
    
    init(priority: String, repeatType: String,reminderDate:Date, reminderTime:Date) {
        self.date = Details.formateDate.string(from: reminderDate)
        self.time = Details.formateTime.string(from: reminderTime)
        self.priority = priority
        self.repeatType = repeatType
        self.reminderDate = reminderDate
        self.reminderTime = reminderTime
        
    }
}

extension Details {
    static var formate: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter
    }
    static var formateDate:DateFormatter{
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .full
        formatter.timeZone = TimeZone.current
        return formatter
    }
    static var formateTime:DateFormatter{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter
    }
}
