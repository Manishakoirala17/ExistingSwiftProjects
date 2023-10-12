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
    @Binding var listData: MyListViewModel
    
    var body: some View {
        List{
            Section{
                Picker("",selection: $listData){
                    ForEach(items){ item in
                        Text("\(item.name)")
                            .tag(item as MyListViewModel)
                    }
                }
                .labelsHidden()
                .pickerStyle(.inline)
            }
        }
    }
}

//#Preview {
//    ListFieldView()
//}
