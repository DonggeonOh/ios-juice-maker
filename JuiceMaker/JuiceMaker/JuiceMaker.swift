//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Fruit: Int, CaseIterable {
    case strawberry, banana, pineapple, kiwi, mango
}

enum Juice {
    case strawberry, banana, pineapple, kiwi, mango, strawnana, mangokiwi, tropical
    
    var recipe: [Fruit: Int] {
        switch self {
        case .strawberry:
            return [.strawberry: 16]
        case .banana:
            return [.banana: 2]
        case .pineapple:
            return [.pineapple: 2]
        case .kiwi:
            return [.kiwi: 3]
        case .mango:
            return [.mango: 3]
        case .strawnana:
            return [.strawberry: 10, .banana: 1]
        case .mangokiwi:
            return [.mango: 2, .kiwi: 1]
        case .tropical:
            return [.strawberry: 1, .banana: 1, .pineapple: 1, .kiwi: 1, .mango: 1]
        }
    }
}

struct Stock {
    private(set) var fruits: [Fruit: Int]
    
    init(basicValue: Int) {
        fruits = [:]
        for fruit in Fruit.allCases {
            fruits[fruit] = basicValue
        }
    }
    
    mutating func decrease(by juice: Juice) {
        for fruit in juice.recipe {
            fruits[fruit.key]? -= fruit.value
        }
    }
    
    mutating func increase(_ fruit: Fruit, by number: Int) {
        fruits[fruit]? += number
    }
}

class JuiceMaker {
    private(set) var stock = Stock(basicValue: 10)
    
    func makeJuice(_ juice: Juice) {
        stock.decrease(by: juice)
    }
}
