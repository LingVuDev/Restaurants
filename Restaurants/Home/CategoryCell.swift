//
//  CategoryCell.swift
//  Restaurants
//
//  Created by Ling on 05.12.18.
//  Copyright © 2018 Ling. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "cellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let featuresCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        return collectionView
    }()
    
    let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    func setupViews() {
        backgroundColor = .clear
        
        addSubview(dividerView)
        dividerView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 2)
        
        
        addSubview(featuresCollectionView)
        featuresCollectionView.anchor(top: topAnchor, left: leftAnchor, bottom: dividerView.topAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 8, paddingRight: 0, width: 0, height: 0)
        
        featuresCollectionView.dataSource = self
        featuresCollectionView.delegate = self
        featuresCollectionView.register(FeaturedCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? FeaturedCell {
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width / 2) - 16 , height: (UIScreen.main.bounds.width / 2) - 16)
    }
}

class FeaturedCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 4
        view.clipsToBounds = true
        return view
    }()
    
    let mealView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "demoFood"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let informationFrameView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.ProjectColors.backgroundInfoColor
        return view
    }()
    
    let nameView: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString()
        attributedText.appendSlim(text: "Steak with fries\n", size: 14, color: .white)
        textView.attributedText = attributedText
        textView.backgroundColor = .clear
        textView.isScrollEnabled = false
        return textView
    }()
    
    
    func setupViews() {
        addSubview(containerView)
        containerView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 4, paddingLeft: 4, paddingBottom: 4, paddingRight: 4, width: 0, height: 0)
        
        containerView.addSubview(mealView)
        mealView.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        containerView.addSubview(informationFrameView)
        let informationFrameHeight = UIScreen.main.bounds.width / 7
        informationFrameView.anchor(top: nil, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: informationFrameHeight)
        
        containerView.addSubview(nameView)
        nameView.anchor(top: informationFrameView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: (informationFrameHeight / 2))
    }
}
