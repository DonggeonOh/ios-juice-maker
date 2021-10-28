//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    private(set) var fruitStock: [Fruit: Int]
    
    enum Operation {
        case addition
        case subtraction
    }
    
    init(initialStock: Int) {
        let uniqueKeys = Fruit.allCases
        let values = Array(repeating: initialStock, count: uniqueKeys.count)
        let dict: [Fruit: Int] = Dictionary(uniqueKeysWithValues: zip(uniqueKeys, values))
        
        self.fruitStock = dict
    }
    
    func changeQuantity(of fruit: Fruit, count: Int, by: Operation) {
        guard let stock = fruitStock[fruit], stock >= 0 else {
            return
        }
        
        let operation: ((Int, Int) -> Int)
        
        switch by {
        case .addition:
            operation = { $0 + $1 }
        case .subtraction:
            operation = { $0 - $1 }
        }
        
        fruitStock[fruit] = operation(stock, count)
    }
    
    func isRemaining(of recipe: [Fruit : Int]) -> Bool {
        for (fruit, count) in recipe {
            
            guard let fruitQuantity = fruitStock[fruit], fruitQuantity >= count else {
                return false
            }
        }
        return true
    }
}
