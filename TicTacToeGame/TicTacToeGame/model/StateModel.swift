//
//  StateModel.swift
//  TicTacToeGame
//
//  Created by Manisha on 29/09/23.
//

import Foundation

class State: ObservableObject{
    @Published var boardState = [[Cell]]()
    @Published var turn = Tile.Cross
    @Published var crossScore = 0
    @Published var noughtScore = 0
    @Published var showAlert = false
    @Published var alertMessage = ""
    init(){
        resetBoard()
    }
    func setTile(_ row: Int,_ col: Int){
        if(boardState[row][col].tile != .Empty){
            return
        }
        boardState[row][col].tile = turn == Tile.Cross ? Tile.Cross : Tile.Nought
//        turn = turn == Tile.Cross ? Tile.Nought : Tile.Cross

        if(checkVictory()){
            if(turn == Tile.Cross){
                crossScore += 1
            }
            else{
                noughtScore += 1
            }
            showAlert = true
//            alertMessage = "\(turn) is won"
        }
        else{
            turn = turn == Tile.Cross ? Tile.Nought : Tile.Cross
        }
    }
    func checkVictory() -> Bool{
      
        if(isTrueTile(0,0) && isTrueTile(0, 1) && isTrueTile(0, 2)){
            return true
        }
        if(isTrueTile(1,0) && isTrueTile(1, 1) && isTrueTile(1, 2)){
            return true
        }
        if(isTrueTile(2,0) && isTrueTile(2, 1) && isTrueTile(2, 2)){
            return true
        }
        if(isTrueTile(0,0) && isTrueTile(1, 0) && isTrueTile(2, 0)){
            return true
        }
        if(isTrueTile(0,1) && isTrueTile(1, 1) && isTrueTile(2, 1)){
            return true
        }
        if(isTrueTile(0,2) && isTrueTile(1, 2) && isTrueTile(2, 2)){
            return true
        }
        if(isTrueTile(0,0) && isTrueTile(1, 1) && isTrueTile(2, 2)){
            return true
        }
        if(isTrueTile(0,2) && isTrueTile(1, 1) && isTrueTile(2, 0)){
            return true
        }
        return false
    }
    
    func isTrueTile(_ row: Int, _ col:Int ) -> Bool{
        return boardState[row][col].tile == turn
    }
    func player() -> Cell{
        let cell = Cell(tile: turn)
        return cell
    }
    
    func resetBoard(){
        var newBoard = [[Cell]]()
        
        for _ in 0...2{
            var row = [Cell]()
            for _ in 0...2{
                row.append(Cell(tile: Tile.Empty))
            }
            newBoard.append(row)
        }
        boardState = newBoard
    }
}
