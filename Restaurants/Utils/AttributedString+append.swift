//
//  AttributedString+append.swift
//  Restaurants
//
//  Created by Ling on 06.12.18.
//  Copyright © 2018 Ling. All rights reserved.
//

import UIKit

extension NSMutableAttributedString {
    func appendSlim(text: String, size: CGFloat, color: UIColor = UIColor.lightGray) {
        append(NSAttributedString(string: text, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: size), NSAttributedString.Key.foregroundColor: color]))
    }
    
    func appendBold(text: String, size: CGFloat, color: UIColor = UIColor.darkGray) {
        append(NSAttributedString(string: text, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: size), NSAttributedString.Key.foregroundColor: color]))
    }
    
}
