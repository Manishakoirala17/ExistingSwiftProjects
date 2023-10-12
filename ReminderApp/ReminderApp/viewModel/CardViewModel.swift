//
//  CardViewModel.swift
//  ReminderApp
//
//  Created by Vignesh on 08/10/23.
//

import Foundation
import SwiftData
import SwiftUI
@Model
class CardViewModel{
    var title:String
    var imageName:String
    var color:String
    var isSelected:Bool
    
    init(title: String, imageName: String, color: String, isSelected: Bool) {
        self.title = title
        self.imageName = imageName
        self.color = color
        self.isSelected = isSelected
    }
}
extension CardViewModel{
    static let cardsList:[CardViewModel] = [
        CardViewModel( title: "Today", imageName: "calendar.circle.fill", color: "blue", isSelected: true),
        CardViewModel( title: "Scheduled", imageName: "calendar.circle", color: "red", isSelected: true),
        CardViewModel( title: "All", imageName: "tray.circle.fill", color: "black", isSelected: true),
        CardViewModel( title: "Completed", imageName: "checkmark.circle.fill", color: "gray", isSelected: true)
    ]
    
    static subscript(color:Color) -> String{
        switch(color){
        case .red:
            return "red"
        case .orange:
            return "orange"
        case .yellow:
            return "yellow"
        case .green:
            return "green"
        case .blue:
            return "blue"
        case .purple:
            return "purple"
        case .brown:
            return "brown"
        case .black:
            return "black"
        case .gray:
            return "gray"
        default:
            return "blue"
            
        }
    }
    static subscript(color:String) -> Color{
        switch(color){
        case "red":
            return .red
        case "orange":
            return .orange
        case "yellow":
            return .yellow
        case "green":
            return .green
        case "blue":
            return .blue
        case "purple":
            return .purple
        case "brown":
            return .brown
        case "black":
            return .black
        case "gray":
            return .gray
        default:
            return .blue
            
        }
    }

}
