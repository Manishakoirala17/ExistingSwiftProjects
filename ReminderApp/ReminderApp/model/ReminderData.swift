//
//  ReminderData.swift
//  ReminderApp
//
//  Created by Manisha on 09/10/23.
//

import Foundation

struct ReminderData{
    var id:UUID = UUID()
    var title:String
    var notes:String
    var details:DetailsModel
    var list:MyListViewModel

}

struct DetailsModel{
    var isDate:Bool
    var date:Date
    var isTime:Bool
    var time:Date
    var isRepeat:Bool
    var priority:String
    var repeatType:String
}
extension ReminderData{
    static var emptyModel: ReminderData {
        ReminderData( title: "", notes: "", details:DetailsModel.emptyDetailModel , list: MyListViewModel(name: "", color: ""))
    }

}

extension DetailsModel{
    static var emptyDetailModel: DetailsModel{
        DetailsModel(isDate:false , date: Date(), isTime: false, time: Date(), isRepeat: false, priority: "", repeatType: "")
    }
}
