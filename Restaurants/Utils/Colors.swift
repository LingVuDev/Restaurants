//
//  Colors.swift
//  Restaurants
//
//  Created by Ling on 06.12.18.
//  Copyright © 2018 Ling. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    struct ProjectColors {
        static let primary = UIColor.rgb(red: 255, green: 255, blue: 255)
        static let mainFontColor = UIColor.rgb(red: 174, green: 174, blue: 174)
        static let backgroundInfoColor = UIColor.init(white: 0, alpha: 0.8)
    }
}

