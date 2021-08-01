//
//  Cardify.swift
//  MemoGame
//
//  Created by Hyago Henrique on 31/07/21.
//

import SwiftUI


struct Cardify: AnimatableModifier {
    
    var rotation: Double
    
    init(isFaceUp: Bool){
        rotation = isFaceUp ? 0 : 180
    }
    
    var animatableData: Double {
        get {return rotation }
        set {rotation = newValue}
    }
    
    var isFaceUp: Bool {
        rotation < 90
    }
    
    func body(content: Content) -> some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: conerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: conerRadius).stroke(lineWidth: edgeLineWidth)
                content
            }.opacity(isFaceUp ? 1 : 0)
            
            RoundedRectangle(cornerRadius: conerRadius).fill()
                .opacity(isFaceUp ? 0 : 1)
            }
        .rotation3DEffect(
            Angle.degrees(rotation),
            axis: (0,1,0)
        )
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

