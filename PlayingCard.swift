//
//  PlayingCard.swift
//  PlayingCard
//
//  Created by YUGWANGYONG on 28/09/2018.
//  Copyright © 2018 Gwang Y. All rights reserved.
//

import Foundation

struct PlayingCard: CustomStringConvertible
{
    
    var description: String { return "\(rank)\(suit)" }
    
    var suit: Suit
    var rank: Rank
    
    enum Suit: String, CustomStringConvertible {
        var description: String
        
        case spades = "♠︎"
        case hearts = "❤️"
        case clubs = "♧"
        case diamonds = "🔷"
        
        static var all = [Suit.spades,.hearts,.diamonds,.clubs]
    }
    
    enum Rank: CustomStringConvertible {
        var description: String
        
        case ace
        case face(String)
        case numeric(Int)
        
        var order: Int {
            switch self {
            case .ace: return 1
            case .numeric(let pips): return pips
            case .face(let kind) where kind == "J": return 11
            case .face(let kind) where kind == "Q": return 12
            case .face(let kind) where kind == "K": return 13
            default: return 0
                
            }
        }
        
        static var all: [Rank] {
            var allRanks = [Rank.ace]
            for pips in 2...10 {
                allRanks.append(Rank.numeric(pips))
            }
            allRanks += [Rank.face("J"),.face("Q"),.face("K")]
            
            return allRanks
        }
    }
}
