//
//  ImageHeaderView.swift
//  Restaurants
//
//  Created by Ling on 18.12.18.
//  Copyright © 2018 Ling. All rights reserved.
//

import UIKit

class ImageHeaderView: UIView {

    override init(frame:CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var imageView:UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    func setupView() {
        self.backgroundColor = UIColor.white
        
        imageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
}
