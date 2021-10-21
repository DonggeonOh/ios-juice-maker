//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    
    private let fruitStore = FruitStore()
    
    func makeJuice(menu: JuiceMenu) throws {
        for (fruit, quantity) in menu.recipe {
            try fruitStore.changeFruitStock(of: fruit, by: quantity, calculate: -)
        }
    }
}

