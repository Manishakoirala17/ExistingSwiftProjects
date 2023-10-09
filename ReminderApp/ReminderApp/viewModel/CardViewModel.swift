//
//  CardViewModel.swift
//  ReminderApp
//
//  Created by Vignesh on 08/10/23.
//

import Foundation

class CardViewModel:ObservableObject{
    
    var cards : [CardDataModel] = fetchCardsDetails()
 
}
func fetchCardsDetails() -> [CardDataModel]{
     return [
        CardDataModel(id: UUID(), title: "Today", imageName: "calendar.circle.fill", color: .blue, count: 0, isSelected: true),
        CardDataModel(id: UUID(), title: "Scheduled", imageName: "calendar.circle", color: .red, count: 0, isSelected: true),
        CardDataModel(id: UUID(), title: "All", imageName: "tray.circle.fill", color: .black, count: 0, isSelected: true),
        CardDataModel(id: UUID(), title: "Completed", imageName: "checkmark.circle.fill", color: .gray, count: 0, isSelected: true)
    ]
}
