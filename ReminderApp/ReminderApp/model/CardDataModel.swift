//
//  CardDataModel.swift
//  ReminderApp
//
//  Created by Manisha on 30/09/23.
//

import Foundation
import SwiftUI

struct CardDataModel : Hashable{
    var id:UUID
    var title:String
    var imageName:String
    var color:Color
    var count:Int
    var isSelected:Bool
}
