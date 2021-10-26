//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation
import UIKit

let notificationCenter: NotificationCenter = .default
let didChangedInventory = Notification.Name("changedInventory")

class FruitStore {
    enum Fruits: String, CaseIterable {
        case strawberry = "strawberry"
        case banana = "banana"
        case pineapple = "pineapple"
        case kiwi = "kiwi"
        case mango = "mango"
    }
    
    private var fruitInventory: [Fruits: Int]
    
    var inventoryStatus: [Fruits: Int] {
        return fruitInventory
    }
    
    static let shared = FruitStore()
    
    private init(defaultStock: Int) {
        self.fruitInventory = [:]
        Fruits.allCases.forEach { fruitInventory[$0] = defaultStock }
    }
    
    private convenience init() {
        self.init(defaultStock: 10)
    }
    
    func add(fruit: Fruits, of count: Int) {
        guard let numberOfFruit = fruitInventory[fruit], count >= 0 else {
            return
        }
        fruitInventory[fruit] = numberOfFruit + count
        notificationCenter.post(name: didChangedInventory, object: nil)
    }
    
    func subtract(fruit: Fruits, of count: Int) {
        guard let numberOfFruit = fruitInventory[fruit], count >= 0 else {
            return
        }
        fruitInventory[fruit] = numberOfFruit - count
        notificationCenter.post(name: didChangedInventory, object: nil)
    }
    
    func hasStock(of fruit: Fruits, count: Int) -> Bool {
        guard let numberOfFruit = fruitInventory[fruit] else {
            return false
        }
        return numberOfFruit >= count
    }
    
}
