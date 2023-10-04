//
//  CardView.swift
//  ReminderApp
//
//  Created by Manisha on 30/09/23.
//

import SwiftUI

struct CardView: View {
    var count:Int
    var title:String
    var imageName: String
    var imageColor:Color
    
    var body: some View {
        HStack{
            VStack{
                Image(systemName: imageName)
                 .resizable()
                 .frame(width: 40,height: 40)
                 .foregroundColor(imageColor)
                 Text(title)
                  .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
             Text("\(count)")
              .font(.largeTitle)
              .foregroundColor(.black)

        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
    }
}

#Preview {
    CardView(count: 0, title: "Today", imageName: "plus", imageColor: .red)
}
