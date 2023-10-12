//
//  AddListView.swift
//  ReminderApp
//
//  Created by Manisha on 02/10/23.
//

import SwiftUI


struct EditListView: View {
    
    @State var listItem:MyListViewModel
    @Binding var isPresented: Bool

    var items: [GridItem] {
      Array(repeating: .init(.flexible()), count: 6)
    }
    
    var body: some View {
        var listcolor = stringToColor(color: listItem.color)
        NavigationStack{
            List{
                Section(header: Text("")){
                    VStack{
                        Image(systemName: "list.bullet.circle.fill")
                            .resizable()
                            .frame(width: 80,height: 80)
                            .foregroundColor(listcolor)
                        
                        HStack{
                            TextField("List Name",text: $listItem.name)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.blue)
                            Spacer()
                            Button(action:{
                                listItem.name = ""
                            }){
                               Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(10)
                        .background(.gray.opacity(0.3))
                        .cornerRadius(10)

                    }
               }
                    VStack{
                        LazyVGrid(columns:items){
                            ForEach(colorsList(),id:\.self){ color in
                                RoundedRectangle(cornerRadius: CGFloat(50))
                                    .frame(width:30,height: 30)
                                    .foregroundColor(color)
                                    .padding(2)
                                    .overlay( listcolor == color ? RoundedRectangle(cornerRadius: 50)
                                        .stroke(.gray.opacity(0.7), lineWidth: 2): nil)
                                    .onTapGesture {
                                        listcolor = color
                                        listItem.color = colorString(color: color)
                                    }
                            }
                        }
                    }
               
               
                
            }
                .toolbar{
                    ToolbarItem(placement:.navigationBarLeading){
                        Button("Cancel"){
                            isPresented = false
                        }
                    }
                    
                    ToolbarItem(placement:.navigationBarTrailing){
                        Button("Done"){
//                            var name = listItem.name
//                            var color = colorString(color: listItem.color)
//                            
//                            context.insert(MyListViewModel(name: name, color: color))
                            isPresented = false
                        }
                    }
                }
                .navigationTitle("List Info")
                .navigationBarTitleDisplayMode(.inline)
        }
       
    }
    func colorsList() -> [Color]{
        return [Color.red,Color.orange,Color.yellow,Color.green,Color.blue,Color.purple,Color.brown]
    }
    
}

