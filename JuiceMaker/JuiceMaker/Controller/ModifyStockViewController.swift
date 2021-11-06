//
//  ModifyStockViewController.swift
//  JuiceMaker
//
//  Created by Sunwoo on 2021/10/25.
//

import UIKit

class ModifyStockViewController: UIViewController {
    // MARK: Properties
    var modifiedStock: [FruitStore.Fruit:Int]
    
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    @IBOutlet private weak var bananaStockLabel: UILabel!
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    @IBOutlet private weak var mangoStockLabel: UILabel!
    
    @IBOutlet private weak var strawberryStockStepper: UIStepper!
    @IBOutlet private weak var bananaStockStepper: UIStepper!
    @IBOutlet private weak var pineappleStockStepper: UIStepper!
    @IBOutlet private weak var kiwiStockStepper: UIStepper!
    @IBOutlet private weak var mangoStockStepper: UIStepper!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeNavigationBar()
        updateAllStockLabels()
        initializeAllStepper()
    }
    
    init?(coder: NSCoder, receivedStock: [FruitStore.Fruit:Int]) {
        self.modifiedStock = receivedStock
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private methods
    
    private func initializeNavigationBar() {
        self.title = "재고 추가"
                
        let cancelButton = UIBarButtonItem(title: "닫기", style: .plain, target: self, action: #selector(touchUpCancelButton))
        
        self.navigationItem.rightBarButtonItem = cancelButton
    }
    
    @objc private func touchUpCancelButton(_ sender: UIButton) {
        NotificationCenter.default.post(name: .receiveModifiedStock, object: nil, userInfo: ["modifiedStock": modifiedStock])
        self.dismiss(animated: true, completion: nil)
    }
    
    private func updateAllStockLabels() {
        let stockLabels: [UILabel]! = [strawberryStockLabel, bananaStockLabel, pineappleStockLabel, kiwiStockLabel, mangoStockLabel]
        
        stockLabels.forEach { stockLabel in
            updateStockLabel(with: stockLabel)
        }
    }
    
    private func updateStockLabel(with label: UILabel) {
        guard let fruit = matchFruit(with: label) else {
            return
        }
        
        guard let currentStockCount = modifiedStock[fruit] else {
            return
        }
        
        label.text = String(currentStockCount)
    }
    
    private func matchFruit(with label: UILabel) -> FruitStore.Fruit? {
        switch label {
        case strawberryStockLabel:
            return .strawberry
        case bananaStockLabel:
            return .banana
        case pineappleStockLabel:
            return .pineapple
        case kiwiStockLabel:
            return .kiwi
        case mangoStockLabel:
            return .mango
        default:
            return nil
        }
    }
    
    private func initializeAllStepper() {
        let stockSteppers: [UIStepper]! = [strawberryStockStepper, bananaStockStepper, pineappleStockStepper, kiwiStockStepper, mangoStockStepper]
        
        stockSteppers.forEach { stockStepper in
            initializeStepper(stepper: stockStepper)
        }
    }
    
    private func initializeStepper(stepper: UIStepper) {
        guard let fruit = matchStepperWithLabelAndFruit(stepper: stepper)?.fruit else {
            return
        }
        
        guard let currentStockCount = modifiedStock[fruit] else {
            return
        }
        
        stepper.value = Double(currentStockCount)
        stepper.minimumValue = 0
        stepper.autorepeat = true
    }
    
    private func matchStepperWithLabelAndFruit(stepper: UIStepper) -> (label: UILabel, fruit: FruitStore.Fruit)? {
        switch stepper {
        case strawberryStockStepper:
            return (strawberryStockLabel, .strawberry)
        case bananaStockStepper:
            return (bananaStockLabel, .banana)
        case pineappleStockStepper:
            return (pineappleStockLabel, .pineapple)
        case kiwiStockStepper:
            return (kiwiStockLabel, .kiwi)
        case mangoStockStepper:
            return (mangoStockLabel, .mango)
        default:
            return nil
        }
    }
}

// MARK: - Actions
extension ModifyStockViewController {
    @IBAction private func stepperValueChanged(_ stepper: UIStepper) {
        guard let (label, fruit) = matchStepperWithLabelAndFruit(stepper: stepper) else {
            return
        }
        
        modifiedStock.updateValue(Int(stepper.value), forKey: fruit)
        updateStockLabel(with: label)
    }
}
