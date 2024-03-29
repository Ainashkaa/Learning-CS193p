//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Ainash Turbayeva on 18.01.2023.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
