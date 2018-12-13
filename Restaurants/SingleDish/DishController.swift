//
//  DishController.swift
//  Restaurants
//
//  Created by Ling Vu on 08.12.18.
//  Copyright © 2018 Ling. All rights reserved.
//

import UIKit

class DishController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    let containerView: UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        scrollView.isScrollEnabled = true
        scrollView.backgroundColor = .red
        return scrollView
    }()
    
    let dishNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Steak with fries"
        label.backgroundColor = .blue
        return label
    }()
    
    func setupView() {
        view.addSubview(containerView)
        containerView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        containerView.addSubview(dishNameLabel)
        dishNameLabel.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 200)
    }
}
