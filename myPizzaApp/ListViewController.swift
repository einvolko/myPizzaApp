

import Foundation
import UIKit
import Kingfisher

class ListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let fetcher = ConfigFetcher()
    
    var config: AppConfig?
    {
        didSet{
            DispatchQueue.main.async {
                self.pizzaCollectionView.reloadData()
                self.rollCollectionView.reloadData()
            }
        }
    }
    
    
    
    @IBOutlet weak var pizzaCollectionView: UICollectionView!
    @IBOutlet weak var rollCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pizzaCollectionView.dataSource = self
        pizzaCollectionView.delegate = self
        rollCollectionView.dataSource = self
        rollCollectionView.dataSource = self
        fetchData()
        pizzaCollectionView.backgroundView = nil
        pizzaCollectionView.backgroundColor = UIColor .clear
        
    }
    func fetchData() {
        fetcher.fetchConfig { [weak self] (error, config) -> Void in
            if let error = error {
                return
            }
            self?.config = config
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.pizzaCollectionView{
           return config?.pizzaList[0].count ?? 0
        } else {
            return config?.pizzaList[1].count ?? 0
        }
    }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if collectionView == self.pizzaCollectionView {
                let cellPizza = collectionView.dequeueReusableCell(withReuseIdentifier: "PizzaCollectionViewCell", for: indexPath)
                if
                    let pizzaCell = cellPizza as? PizzaCollectionViewCell,
                    let pizza = config?.pizzaList[0][indexPath.row] {
                    pizzaCell.pizzaNameLabel.text = pizza.pizzaName
                    pizzaCell.pizzaDescriptionLabel.text = pizza.pizzaDescription
                    pizzaCell.pizzaCostLabel.text = String(pizza.pizzaCost)
                    let url = URL(string: pizza.pizzaImage)
                    let processor = RoundCornerImageProcessor(cornerRadius: 200)
                    pizzaCell.pizzaImageView.kf.indicatorType = .activity
                    pizzaCell.pizzaImageView.kf.setImage(with: url, options:[ .processor(processor)])
                }
                return cellPizza
            } else {
                let cellRoll = collectionView.dequeueReusableCell(withReuseIdentifier: "RollCollectionViewCell", for: indexPath)
                if
                    let rollCell = cellRoll as? RollCollectionViewCell,
                    let roll = config?.pizzaList[1][indexPath.row] {
                    
                    rollCell.rollNameLabel.text = roll.pizzaName
                    rollCell.rollDescriptionLabel.text = roll.pizzaDescription
                    rollCell.rollCostLabel.text = String(roll.pizzaCost)
                    let url = URL(string: roll.pizzaImage)
                    let processor = RoundCornerImageProcessor(cornerRadius: 200)
                    rollCell.rollImageView.kf.indicatorType = .activity
                    rollCell.rollImageView.kf.setImage(with: url, options:[ .processor(processor)])
                }
                return cellRoll
            }
            
        }
        
        
    }

