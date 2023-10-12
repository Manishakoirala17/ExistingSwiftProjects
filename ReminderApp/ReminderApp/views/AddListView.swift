//
//  AddListView.swift
//  ReminderApp
//
//  Created by Manisha on 02/10/23.
//

import SwiftUI


struct AddListView: View {
    @Binding var isPresented: Bool
    @Environment(\.modelContext) var context
    @State var listItem:MyListModel = MyListModel.emptyModel
    
    var items: [GridItem] {
      Array(repeating: .init(.flexible()), count: 6)
    }
    
    var body: some View {
        NavigationStack{
            List{
                Section(header: Text("")){
                    VStack{
                        Image(systemName: "list.bullet.circle.fill")
                            .resizable()
                            .frame(width: 80,height: 80)
                            .foregroundColor(listItem.color)
                        
                        HStack{
                            TextField("List Name",text: $listItem.name)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.blue)
                            Spacer()
                            Image(systemName: "multiply.circle.fill")
                                 .foregroundColor(.gray)
                                 .onTapGesture(perform: {
                                     listItem.name = ""
                                 })
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
                                    .overlay(listItem.color == color ? RoundedRectangle(cornerRadius: 50)
                                        .stroke(.gray.opacity(0.7), lineWidth: 2): nil)
                                    .onTapGesture {
                                        listItem.color = color
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
                            let name = listItem.name
                            let color = CardViewModel[listItem.color]
                            let list = MyListViewModel(name: name, color: color)
                            context.insert(list)
                            list.reminders = []
                            isPresented = false
                        }
                    }
                }
                .navigationTitle("New List")
                .navigationBarTitleDisplayMode(.inline)
        }
       
    }
    func colorsList() -> [Color]{
        return [Color.red,Color.orange,Color.yellow,Color.green,Color.blue,Color.purple,Color.brown]
    }
    
}

//#Preview {
//    AddListView(isPresented: .constant(true))
//}
