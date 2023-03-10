//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ainash Turbayeva on 24.01.2023.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
    static let emojis = ["đ", "đ", "âī¸", "đļ", "đ", "đ", "đĢ", "đŠī¸", "đ ", "đ", "đ", "đ¸", "đ", "đ", "âĩī¸", "đ¤", "đĨī¸", "đŗī¸", "đĸ", "đ", "đ", "đ", "đ", "đ" ]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published var model: MemoryGame<String> = createMemoryGame()
    
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    //MARK: - Intent(s)
    
    func choose( _ card: MemoryGame<String>.Card){
        model.choose(card)
    }

}
