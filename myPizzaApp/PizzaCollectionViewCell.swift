//
//  PizzaCollectionViewCell.swift
//  myPizzaApp
//
//  Created by Михаил Супрун on 16.03.2023.
//

import UIKit

class PizzaCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var pizzaImageView: UIImageView!
    @IBOutlet weak var pizzaNameLabel: UILabel!
    @IBOutlet weak var pizzaDescriptionLabel: UILabel!
    @IBOutlet weak var pizzaCostLabel: UILabel!
}

class RollCollectionViewCell: UICollectionViewCell{
    
    @IBOutlet weak var rollImageView: UIImageView!
    @IBOutlet weak var rollNameLabel: UILabel!
    @IBOutlet weak var rollDescriptionLabel: UILabel!
    @IBOutlet weak var rollCostLabel: UILabel!
}
