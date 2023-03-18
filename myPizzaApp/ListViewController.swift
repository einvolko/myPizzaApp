

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
            }
        }
    }
    
    
    
    @IBOutlet weak var pizzaCollectionView: UICollectionView!
//    @IBOutlet weak var rollCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pizzaCollectionView.dataSource = self
        pizzaCollectionView.delegate = self
//        rollCollectionView.dataSource = self
//        rollCollectionView.dataSource = self
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
//        if collectionView == self.pizzaCollectionView{
            config?.pizzaList.count ?? 0
        }
//        return config?.rollList.count ?? 0
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if collectionView == self.pizzaCollectionView {
            let cellPizza = collectionView.dequeueReusableCell(withReuseIdentifier: "PizzaCollectionViewCell", for: indexPath)
            if
                let pizzaCell = cellPizza as? PizzaCollectionViewCell,
                let pizza = config?.pizzaList[indexPath.row] {
                pizzaCell.pizzaNameLabel.text = pizza.pizzaName
                pizzaCell.pizzaDescriptionLabel.text = pizza.pizzaDescription
                pizzaCell.pizzaCostLabel.text = pizza.pizzaCost
                let url = URL(string: pizza.pizzaImage)
                let processor = RoundCornerImageProcessor(cornerRadius: 200)
                pizzaCell.pizzaImageView.kf.indicatorType = .activity
                pizzaCell.pizzaImageView.kf.setImage(with: url, options:[ .processor(processor)])
            }
            return cellPizza
//        } else {
//            let cellRoll = collectionView.dequeueReusableCell(withReuseIdentifier: "RollCollectionViewCell", for: indexPath)
//            if
//                let rollCell = cellRoll as? RollCollectionViewCell,
//                let roll = config?.rollList[indexPath.row] {
//
//                rollCell.rollNameLabel.text = roll.rollName
//                rollCell.rollDescriptionLabel.text = roll.rollDescription
//                rollCell.rollCostLabel.text = roll.rollCost
//                let url = URL(string: roll.rollImage)
//                let processor = RoundCornerImageProcessor(cornerRadius: 200)
//                rollCell.rollImageView.kf.indicatorType = .activity
//                rollCell.rollImageView.kf.setImage(with: url, options:[ .processor(processor)])
//            }
//            return cellRoll
        }
        
    }


