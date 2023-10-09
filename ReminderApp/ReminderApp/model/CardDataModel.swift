//
//  CardDataModel.swift
//  ReminderApp
//
//  Created by Manisha on 30/09/23.
//

import Foundation
import SwiftUI

struct CardDataModel : Hashable{
    var title:String
    var imageName:String
    var color:Color
    var count:Int
    var isSelected:Bool
}

extension CardDataModel{
    static func all() -> [CardDataModel]{
        return [
            CardDataModel(title: "Today", imageName: "calendar.circle.fill", color: .blue, count: 0, isSelected: true),
            CardDataModel(title: "Scheduled", imageName: "calendar.circle", color: .red, count: 0, isSelected: true),
            CardDataModel(title: "All", imageName: "tray.circle.fill", color: .black, count: 0, isSelected: true),
            CardDataModel(title: "Completed", imageName: "checkmark.circle.fill", color: .gray, count: 0, isSelected: true),
        ]
    }
}
