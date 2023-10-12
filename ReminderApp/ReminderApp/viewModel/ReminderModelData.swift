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
    var isCompleted:Bool
    var list:MyListViewModel?
   
    init(id: UUID, title: String, notes: String,details:Details,isCompleted:Bool = false) {
        self.id = id
        self.title = title
        self.notes = notes
        self.details = details
        self.isCompleted = isCompleted
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
        self.date = ReminderModelData.formateDate.string(from: reminderDate)
        self.time = ReminderModelData.formateTime.string(from: reminderTime)
        self.priority = priority
        self.repeatType = repeatType
        self.reminderDate = reminderDate
        self.reminderTime = reminderTime
        
    }
}

extension ReminderModelData {
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
    static func currentPredicate() -> Predicate<ReminderModelData> {
        let currentDate = Date.now

        return #Predicate<ReminderModelData> { reminder in
            reminder.details.reminderDate < currentDate
        }
    }

}
