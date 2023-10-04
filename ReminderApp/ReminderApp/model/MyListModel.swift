//
//  MyListModel.swift
//  ReminderApp
//
//  Created by Manisha on 02/10/23.
//

import Foundation
import SwiftUI

struct MyListModel : Identifiable,Hashable{
    var id:UUID = UUID()
    var name:String
    var color: Color
}

extension MyListModel{
    static var emptyModel: MyListModel {
        MyListModel(name:"",color: .red)
    }

}
