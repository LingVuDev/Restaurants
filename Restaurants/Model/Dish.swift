//
//  Dish.swift
//  Restaurants
//
//  Created by Ling on 08.12.18.
//  Copyright © 2018 Ling. All rights reserved.
//

import Foundation

struct Dish {
    let name: String
    let categories: [MenuCategory]
    let decription: String
    let price: Double
    let imageUrl: URL?
    let rating: Double
    let allergy: [String]?

}
