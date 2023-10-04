//
//  TileModel.swift
//  TicTacToeGame
//
//  Created by Manisha on 29/09/23.
//

import Foundation
import SwiftUI

struct Cell{
    var tile:Tile
    
    func displayTile() -> String{
        switch(tile){
        case .Nought:
            return "O"
        case .Cross:
            return "X"
        default:
            return ""
        }
    }
    
    func color() -> Color{
        switch(tile){
        case .Nought:
            return Color.red
        case .Cross:
            return Color.blue
        default:
            return Color.red
        }
    }
}

enum Tile{
    case Nought
    case Cross
    case Empty
}
