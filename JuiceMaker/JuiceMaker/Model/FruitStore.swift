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
    
    init(stock: Int) {
        let uniqueKeys = Fruit.allCases
        let values = Array(repeating: stock, count: uniqueKeys.count)
        let dict: [Fruit: Int] = Dictionary(uniqueKeysWithValues: zip(uniqueKeys, values))
        
        self.fruitStock = dict
    }
    
    func changeQuantity(of fruit: Fruit, step: Int, by operation: Operation) {
        guard let stock = fruitStock[fruit], stock >= 0 else {
            return
        }
        
        let calculator: ((Int, Int) -> Int)
        
        switch operation {
        case .addition:
            calculator = { $0 + $1 }
        case .subtraction:
            calculator = { $0 - $1 }
        }
        
        fruitStock[fruit] = calculator(stock, step)
    }
    
    func changeQuantity(of fruit: Fruit, to count: Int) {
        guard let stock = fruitStock[fruit], stock >= 0 else {
            return
        }
        fruitStock[fruit] = count
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
