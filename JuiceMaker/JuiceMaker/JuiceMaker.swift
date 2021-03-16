//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

struct JuiceMaker {
    static let shared = JuiceMaker()
    
    var fruitInformation: [FruitTypes: FruitStock] = [
        .strawberry: FruitStock(.strawberry, 10),
        .banana: FruitStock(.banana, 10),
        .kiwi: FruitStock(.kiwi, 10),
        .mango: FruitStock(.mango, 10),
        .pineapple: FruitStock(.pineapple, 10)
    ]
    
    func didMakeJuice(of orderedMenu: JuiceTypes) -> Bool {
        for (fruitType, requiredAmount) in orderedMenu.recipe() {
            if let fruit = fruitInformation[fruitType], fruit.isStockExist(requiredAmount) {
                    fruit.subtractStock(requiredAmount)
                } else { return false }
            }
        return true
    }
    
    func fruitStock(of fruit: FruitTypes) throws -> String {
        guard let fruitStock = fruitInformation[fruit] else {
            throw JuiceMakerError.invalidFruit }
        return String(fruitStock.stock)
    }
}
