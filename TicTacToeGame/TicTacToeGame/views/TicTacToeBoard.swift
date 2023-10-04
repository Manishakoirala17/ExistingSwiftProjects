//
//  TicTacToeBoard.swift
//  TicTacToeGame
//
//  Created by Manisha on 29/09/23.
//

import SwiftUI

struct TicTacToeBoard: View {
    
    @StateObject var stateBoard = State()

    
    var body: some View {
        let borderSize = CGFloat(5)
        let player = stateBoard.player()
        VStack{
            HStack{
                Text("X - score: \(stateBoard.crossScore)")
                    .foregroundColor(.red)
                Spacer()
                Text("O - score: \(stateBoard.noughtScore)")
                    .foregroundColor(.blue)

            }
            .padding()
            Text("Turn - \(player.displayTile())")
                .padding()
                .font(.system(size: 40))
            VStack(spacing: borderSize){
                ForEach(0...2,id: \.self){ row in
                    
                    HStack(spacing: borderSize){
                        ForEach(0...2,id: \.self){ column in
                            let cell =  stateBoard.boardState[row][column]
                            Text(cell.displayTile())
                                .font(.system(size: 60))
                                .bold()
                                .frame(maxWidth: .infinity,maxHeight: .infinity)
                                .aspectRatio(1,contentMode: .fit)
                                .background(.white)
                                .foregroundColor(cell.color())
                                .onTapGesture {
                                    stateBoard.setTile(row, column)
                                }
                        }
                    }
                   
                }
            }
           
            .background(.black)
            Button("reset"){
                stateBoard.resetBoard()
            }
            .alert(isPresented: $stateBoard.showAlert) {
                Alert(
                    title: Text("Player \(stateBoard.player().displayTile())"),
                    message: Text("Player \(stateBoard.player().displayTile()) is won"),
                    primaryButton: .default(
                        Text("Ok"),
                        action: {
                            stateBoard.resetBoard()
                        }
                    ), secondaryButton: .cancel()


                )
            }

        }
       
    }
}

//#Preview {
//    TicTacToeBoard()
//}
