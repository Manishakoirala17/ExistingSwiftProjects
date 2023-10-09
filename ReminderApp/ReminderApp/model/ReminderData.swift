//
//  ReminderData.swift
//  ReminderApp
//
//  Created by Manisha on 09/10/23.
//

import Foundation

struct ReminderData{
    var id:UUID
    var title:String
    var notes:String
    var details:DetailsModel
//    var list:MyListViewModel?
    
    init( title: String = "", notes: String="", details: DetailsModel = DetailsModel()) {
        self.id = UUID()
        self.title = title
        self.notes = notes
        self.details = details
//        self.list = list
    }
}

struct DetailsModel{
    var isDate:Bool
    var date:Date
    var isTime:Bool
    var time:Date
    var isRepeat:Bool
    var priority:String
    var repeatType:String
    init(isDate: Bool = false, date: Date = Date(), isTime: Bool = false, time: Date = Date(), isRepeat: Bool = false, priority: String = "", repeatType: String="") {
        self.isDate = isDate
        self.date = date
        self.isTime = isTime
        self.time = time
        self.isRepeat = isRepeat
        self.priority = priority
        self.repeatType = repeatType
    }

}
