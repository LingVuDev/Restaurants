//
//  HomeController.swift
//  Restaurants
//
//  Created by Ling on 05.12.18.
//  Copyright © 2018 Ling. All rights reserved.
//

import UIKit

class FeaturedController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "cellId"
    public let groupDishes: [[Dish]] = [
        [
            Dish(name: "Steak", categories: [demoCategory], decription: "", price: 10.0, imageUrl: nil, rating: 5, allergy: nil),
            Dish(name: "Schnitzel", categories: [demoCategory], decription: "", price: 10.0, imageUrl: nil, rating: 5, allergy: nil),
            Dish(name: "Ente", categories: [demoCategory], decription: "", price: 10.0, imageUrl: nil, rating: 5, allergy: nil)
        ],
        [
            Dish(name: "Broccoli", categories: [demoCategory], decription: "", price: 10.0, imageUrl: nil, rating: 5, allergy: nil),
            Dish(name: "Bambus", categories: [demoCategory], decription: "", price: 10.0, imageUrl: nil, rating: 5, allergy: nil),
            Dish(name: "Soja", categories: [demoCategory], decription: "", price: 10.0, imageUrl: nil, rating: 5, allergy: nil)
        ],
        [
            Dish(name: "Eiscreme", categories: [demoCategory], decription: "", price: 10.0, imageUrl: nil, rating: 5, allergy: nil),
            Dish(name: "Kuchen", categories: [demoCategory], decription: "", price: 10.0, imageUrl: nil, rating: 5, allergy: nil),
            Dish(name: "Torte", categories: [demoCategory], decription: "", price: 10.0, imageUrl: nil, rating: 5, allergy: nil)
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.backgroundColor = .white
        collectionView.alwaysBounceVertical = true
        navigationItem.title = "Featured"
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? CategoryCell {
            cell.delegate = self
            cell.dishes = groupDishes[indexPath.item]
            return cell
        }
        return UICollectionViewCell()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 250)
    }
    
    
}

extension FeaturedController: CategoryCellDelegate {
    func didSelectDish(dish: Dish) {
        let controller = DishController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
