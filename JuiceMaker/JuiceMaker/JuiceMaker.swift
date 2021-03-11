//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

/// 쥬스 메이커 타입


class JuiceMaker {
    func checkStock(of fruit: Fruit) {
        print("\(fruit)는 현재 \(fruit.stock)개 남아있습니다.")
    }
    
    func make(menu: Juice) {
        if menu.canMake {
            for requirement in menu.requirements {
                requirement.Fruit.subtractStock(amount: requirement.needAmount)
            }
            
            print("\(menu)의 제조가 완료되었습니다!")
        } else {
            print("재고가 부족하여 \(menu)을(를) 만들 수 없습니다.")
            
            for requirement in menu.requirements {
                if requirement.needAmount > requirement.Fruit.stock {
                    print("\(requirement.Fruit)의 현재 재고: \(requirement.Fruit.stock), 필요량: \(requirement.needAmount)")
                }
            }
        }
    }
    
    func addStock(_ amount: Int, for fruitType: Fruit) {
        fruitType.addStock(amount: amount)
    }
}
