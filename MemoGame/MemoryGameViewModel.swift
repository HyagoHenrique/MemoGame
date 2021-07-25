//
//  MemoryGameViewModel.swift
//  MemoGame
//
//  Created by Hyago Henrique on 12/07/21.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGameModel<String> = createMemoryGame()
    
    
    private static func createMemoryGame() -> MemoryGameModel<String> {
        let emojis = ["🔥","🤪","🥴","🧐", "😝"]
        return MemoryGameModel<String>(numbersOfPairsOfCards: emojis.count) { pairIndex  in
            return emojis[pairIndex]
        }
    }
    
    
    //MARK: - Acess to the Model
    
    var cards: Array<MemoryGameModel<String>.Card> {
        model.cards
    }
    
    //MARK: - Intent(s)
    
    func choose(card: MemoryGameModel<String>.Card){
        model.choose(card: card)
    }
}
