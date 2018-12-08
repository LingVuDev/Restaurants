//
//  Dish.swift
//  Restaurants
//
//  Created by Ling on 08.12.18.
//  Copyright © 2018 Ling. All rights reserved.
//

import Foundation

struct Dish {
    enum Category {
        case friedRice
        case friedNoodle
        case pork
        case beef
        case duck
        case fish
        case vietnamese
        case soup
        case starter
        case salat
        case seafood
        case special
        case kids
        case vegan
        case sushi
    }
    
    enum Allergy {
        case nuts
        case egg
        case fruits
    }
    
    let name: String
    let category: Category
    let decription: String
    let price: Double
    let imageUrl: URL
    let allergy: [Allergy]
}
