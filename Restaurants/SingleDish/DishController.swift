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
        
        self.view.backgroundColor = .red
        
        setupHeaderView()
        setupTableView()
    }
    
    let imageViewHeight: CGFloat = 200
    var headerView:ImageHeaderView = {
        let headerView = ImageHeaderView()
        return headerView
    }()
    
    var tableView:UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    var headerHeightConstraint:NSLayoutConstraint!
    
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
    
    func setupHeaderView() {
        //        view.addSubview(containerView)
        //        containerView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        //
        //        containerView.addSubview(dishNameLabel)
        //        dishNameLabel.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 200)
        view.addSubview(headerView)
        headerView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        headerHeightConstraint = headerView.heightAnchor.constraint(equalToConstant: imageViewHeight)
        headerHeightConstraint.isActive = true
        
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
        tableView.backgroundColor = .yellow
        tableView.anchor(top: headerView.bottomAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    func animateHeader() {
        self.headerHeightConstraint.constant = imageViewHeight
        
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        })
    }
}

extension DishController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if self.headerHeightConstraint.constant > imageViewHeight {
            animateHeader()
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if self.headerHeightConstraint.constant > imageViewHeight {
            animateHeader()
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            self.headerHeightConstraint.constant += abs(scrollView.contentOffset.y)
        }
    }
}
