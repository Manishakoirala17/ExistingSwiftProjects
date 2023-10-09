//
//  EditDashboardView.swift
//  ReminderApp
//
//  Created by Vignesh on 06/10/23.
//

import SwiftUI
import SwiftData

struct EditDashboardView: View {
    @Environment(\.presentationMode) var presentationMode

    @State var cardItems:[CardDataModel] = CardDataModel.all()
     @Query var listItems:[MyListViewModel]
    @State var search = ""
    var body: some View {
        NavigationView{
            List{
                SearchBar(search: $search)
                    .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                    .listRowBackground(Color.gray.opacity(0.0))
                    .listRowSeparator(.hidden)
                
                Section{
                    ForEach(cardItems,id: \.self) { item in
                        HStack{
                            Button(action:{
                                print("")
                            }){
                                if(item.isSelected){
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.blue)
                                }
                                else{
                                    Image(systemName: "circle")

                                }
                            }
                           
                            Image(systemName: item.imageName)
                                .resizable()
                                .frame(width: 30,height: 30)
                                .foregroundColor(item.color)
                            Text(item.title)
                            Spacer()
                            Image(systemName: "line.horizontal.3")
                                .foregroundColor(.gray)

                        }
                    }
                }
                Section(header:Text("My Lists").bold().font(.largeTitle).foregroundColor(.black))
                {
                    ForEach(listItems,id:\.self) { item in
                        HStack{
                            Image(systemName: "minus.circle.fill")
                                .foregroundColor(.red)
                            Image(systemName: "list.bullet.circle.fill")
                                .resizable()
                                .frame(width: 20,height: 20)
                                .foregroundColor(stringToColor(color: item.color))
                            Text(item.name)
                            Spacer()
                            Image(systemName: "info.circle")
                                .foregroundColor(.blue)
                            Divider()
                            Image(systemName: "line.horizontal.3")
                                .foregroundColor(.gray)

                        }
                    }
                }
               
            }
            .toolbar{
                ToolbarItem{
                    Button("Done")
                    {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    EditDashboardView()
}
