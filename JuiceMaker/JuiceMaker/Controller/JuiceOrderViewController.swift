
import UIKit

class JuiceOrderViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    private let fruitStore: FruitStore = FruitStore.shared
    
    @IBOutlet weak var strawberryBananaOrderButton: UIButton!
    @IBOutlet weak var mangoKiwiOrder: UIButton!
    @IBOutlet weak var strawberryOrder: UIButton!
    @IBOutlet weak var bananaOrder: UIButton!
    @IBOutlet weak var mangoOrder: UIButton!
    @IBOutlet weak var kiwiOrder: UIButton!
    @IBOutlet weak var pineappleOrder: UIButton!
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitsStock()
    }

    @IBAction func clickJuiceButton(_ sender: UIButton) {
        var juice: Juices
        
        switch sender {
        case strawberryOrder: juice = .strawberry
        case strawberryBananaOrderButton: juice = .strawberrybanana
        case bananaOrder: juice = .banana
        case mangoKiwiOrder: juice = .mangokiwi
        case mangoOrder: juice = .mango
        case kiwiOrder: juice = .kiwi
        case pineappleOrder: juice = .pineapple
        default:
            juice = .strawberry // temp
        }
        
        welcomeJuice(juice: juice)
    }
    
    func welcomeJuice(juice: Juices) {
        do {
            try juiceMaker.makeJuice(juice: juice)
            updateFruitsStock()
            showSuccessAlert(juice: juice)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func updateFruitsStock() {
        strawberryStockLabel.text = String(fruitStore.fruitStorage[.strawberry] ?? .zero)
        bananaStockLabel.text = String(fruitStore.fruitStorage[.banana] ?? .zero)
        kiwiStockLabel.text = String(fruitStore.fruitStorage[.kiwi] ?? .zero)
        mangoStockLabel.text = String(fruitStore.fruitStorage[.mango] ?? .zero)
        pineappleStockLabel.text = String(fruitStore.fruitStorage[.pineapple] ?? .zero)
    }
    
    func showSuccessAlert(juice: Juices) {
        
        let alert = UIAlertController(title: nil, message: "\(juice)가 나왔습니다. 맛있게 드세요!😁", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
}

