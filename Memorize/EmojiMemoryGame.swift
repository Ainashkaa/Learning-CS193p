//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ainash Turbayeva on 24.01.2023.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
    static let emojis = ["🚂", "🚀", "✈️", "🛶", "🚈", "🚆", "🛫", "🛩️", "🚠", "🚔", "🚘", "🛸", "🚁", "🛟", "⛵️", "🚤", "🛥️", "🛳️", "🚢", "🚝", "🚟", "🚉", "🚃", "🚍" ]
    
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
