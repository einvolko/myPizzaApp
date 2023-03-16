

import Foundation
import UIKit

class ListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let fetcher = ConfigFetcher()
    
    var config: AppConfig? {
        didSet{
            DispatchQueue.main.async {
                self.pizzaCollectionView.reloadData()
            }
        }
    }
    
    @IBOutlet weak var pizzaCollectionView: UICollectionView!
    
    @IBOutlet weak var rollCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    
    }
    func collectionView(_ pizzaCollectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        config?.pizzaList.count ?? 0
    }
    func collectionView(_ pizzaCollectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = pizzaCollectionView.dequeueReusableCell(withReuseIdentifier: "PizzaCollectionViewCell", for: indexPath)
        
        if
            let pizzaCell = cell as? PizzaCollectionViewCell,
            let pizza = config?.pizzaList[indexPath.row] {
            let url = URL(string: "pizza.pizzaImage")
            let data = try? Data(from: url as! Decoder)
            pizzaCell.pizzaImageView.image = UIImage(data: data!)
            pizzaCell.pizzaNameLabel.text = pizza.pizzaName
            pizzaCell.pizzaDescriptionLabel.text = pizza.pizzaDescription
            pizzaCell.pizzaCostLabel.text = String(pizza.pizzaCost)
        }
        return cell
    }
    
        }
    

