//
//  MemoGameView.swift
//  MemoGame
//
//  Created by Hyago Henrique on 12/07/21.
//

import SwiftUI

struct MemoGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        Grid(viewModel.cards) { card in
            CardView(card: card).onTapGesture{
                viewModel.choose(card: card)
            }
            .padding(5)
            
            
        }
        .padding()
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    var card: MemoryGameModel<String>.Card
    
    var body: some View{
        GeometryReader { geometry in
            body(for: geometry.size)
            
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack() {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: conerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: conerRadius).stroke(lineWidth: edgeLineWidth)
                Text(card.content)
            } else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: conerRadius).fill()
                }
            }
            
        }.font(Font.system(size: fontSize(for: size)))
    }
    
    //Mark - Drawing Constants
    private  let conerRadius: CGFloat = 10.0
    private  let edgeLineWidth: CGFloat = 3
    private  func fontSize(for size: CGSize) -> CGFloat {
                min(size.width, size.height) * 0.75
    }
    
    
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MemoGameView(viewModel: EmojiMemoryGame())
    }
}
