//
//  SearchBar.swift
//  ReminderApp
//
//  Created by Manisha on 02/10/23.
//

import SwiftUI

struct SearchBar: View {
    @Binding var search:String
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
            TextField("Search",text: $search)
        }
        .padding(4)
        .background(.gray.opacity(0.3))
        .cornerRadius(10)
    }
}

#Preview {
    SearchBar(search: .constant(""))
}
