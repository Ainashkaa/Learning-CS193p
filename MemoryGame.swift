//
//  MemoryGame.swift
//  Memorize
//
//  Created by Ainash Turbayeva on 24.01.2023.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyOneFaceUpCard: Int?
    
     mutating func choose(_ card: Card){
         if let chosenIndex = cards.firstIndex(where: {$0.id == card.id }),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched
         {
             if let potentialMatchIndex = indexOfTheOneAndOnlyOneFaceUpCard {
                 if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                     cards[chosenIndex].isMatched = true
                     cards[potentialMatchIndex].isMatched = true
                 }
                 indexOfTheOneAndOnlyOneFaceUpCard = nil
             }else {
                 for index in cards.indices {
                     cards[index].isFaceUp = false
                 }
                 indexOfTheOneAndOnlyOneFaceUpCard = chosenIndex
             }
             cards[chosenIndex].isFaceUp.toggle()
         }
        print("\(cards)")
    }
    

    
    init(numberOfPairOfCards: Int, createContent: (Int) -> CardContent){
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairOfCards{
            let content:CardContent = createContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        
    }
    
    struct Card: Identifiable{
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
