//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ainash Turbayeva on 24.01.2023.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["🚲", "🚂", "🚀", "✈️", "🛶", "🚈", "🚆", "🛫", "🛩️", "🚠", "🚔", "🚘", "🛸", "🚁", "🛟", "⛵️", "🚤", "🛥️", "🛳️", "🚢", "🚝", "🚟", "🚉", "🚃"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairOfCards: 8) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card>{
        return model.cards
    }
    
    //MARK: - Intent(s)
    
    func choose( _ card: Card){
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func restart() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}
