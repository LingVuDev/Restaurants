//
//  ViewController.swift
//  Restaurants
//
//  Created by Ling on 03.12.18.
//  Copyright © 2018 Ling. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViewController()
    }
    
    func setupViewController() {
        let homeController = templateNavController(unselectedImage: #imageLiteral(resourceName: "star"), selectedImage: #imageLiteral(resourceName: "star"), rootViewController: UIViewController())
        
        let menuController = templateNavController(unselectedImage: #imageLiteral(resourceName: "food"), selectedImage: #imageLiteral(resourceName: "food"), rootViewController: UIViewController())

        let locationController = templateNavController(unselectedImage: #imageLiteral(resourceName: "maps-and-flags"), selectedImage: #imageLiteral(resourceName: "maps-and-flags"), rootViewController: UIViewController())
        
        let couponController = templateNavController(unselectedImage: #imageLiteral(resourceName: "discount"), selectedImage: #imageLiteral(resourceName: "discount"), rootViewController: UIViewController())
        
        tabBar.tintColor = .black
        viewControllers = [homeController, menuController, locationController, couponController]
        tabBar.items?[0].title = "Featured"
        tabBar.items?[1].title = "The Menu"
        tabBar.items?[2].title = "Locations"
        tabBar.items?[3].title = "Coupons"
        
        //        // modify tab bar item insets
        //        guard let items = tabBar.items else { return }
        //        for item in items {
        //            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        //        }
    }
    
    fileprivate func templateNavController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController = UIViewController()) -> UINavigationController {
        let navController = UINavigationController(rootViewController: rootViewController)
        
        let tabBarSize = CGSize(width: 15, height: 15)
        
        navController.tabBarItem.image = unselectedImage.scaleImage(toSize: tabBarSize)
        navController.tabBarItem.selectedImage = selectedImage.scaleImage(toSize: tabBarSize)
        
        return navController
    }
}

extension UIImage {
    func scaleImage(toSize newSize: CGSize) -> UIImage? {
        var newImage: UIImage?
        let newRect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height).integral
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0)
        if let context = UIGraphicsGetCurrentContext(), let cgImage = self.cgImage {
            context.interpolationQuality = .high
            let flipVertical = CGAffineTransform(a: 1, b: 0, c: 0, d: -1, tx: 0, ty: newSize.height)
            context.concatenate(flipVertical)
            context.draw(cgImage, in: newRect)
            if let img = context.makeImage() {
                newImage = UIImage(cgImage: img)
            }
            UIGraphicsEndImageContext()
        }
        return newImage
    }
}
