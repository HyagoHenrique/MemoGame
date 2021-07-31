//
//  Cardify.swift
//  MemoGame
//
//  Created by Hyago Henrique on 31/07/21.
//

import SwiftUI


struct Cardify: ViewModifier {
    var isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: conerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: conerRadius).stroke(lineWidth: edgeLineWidth)
                content
            } else {
                    RoundedRectangle(cornerRadius: conerRadius).fill()
                }
            }
        }

    //Mark - Drawing Constants
    private  let conerRadius: CGFloat = 10.0
    private  let edgeLineWidth: CGFloat = 3

}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}

