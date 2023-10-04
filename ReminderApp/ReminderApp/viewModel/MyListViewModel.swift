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
    init(name: String = "test",color:String = "red") {
        self.name = name
        self.color = color
    }
}

