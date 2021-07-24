//
//  MemoGameModel.swift
//  MemoGame
//
//  Created by Hyago Henrique on 12/07/21.
//

import Foundation


struct MemoryGameModel<CardContent> {
    var cards: Array<Card>
    
    mutating func choose(card: Card){
        print("card choosen: \(card)")
        let chosenIndex: Int = index(of: card)
        cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
        
    }
    
    func index(of card: Card) -> Int{
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
                
            }
        }
        return 0 // TODO: bogus!
    }
    
    
    init(numbersOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = Array<Card>()
        for pairIndex in 0..<numbersOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
