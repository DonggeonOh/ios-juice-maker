//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let juiceMaker = JuiceMaker()
        juiceMaker.makeJuice(menu: .banana)
        juiceMaker.makeJuice(menu: .strawberryBanana)
        juiceMaker.makeJuice(menu: .kiwi)
    }
}
