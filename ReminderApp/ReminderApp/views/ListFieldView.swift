//
//  ListFieldView.swift
//  ReminderApp
//
//  Created by Vignesh on 06/10/23.
//

import SwiftUI
import SwiftData

struct ListFieldView: View {
    @Query var items:[MyListViewModel]
    
    var body: some View {
        List{
            ForEach(items,id: \.self){ item in
                HStack{
                    Text(item.name)
                    Spacer()
                    Image(systemName:"checkmark")
                }
            }
        }
    }
}

#Preview {
    ListFieldView()
}
