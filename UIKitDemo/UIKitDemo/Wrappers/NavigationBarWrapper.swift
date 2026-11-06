//
//  NavigationBarWrapper.swift
//  Aditya Tes
//
//  Created by Kamal Saini on 04/05/26.
//

import Foundation
import UIKit

struct NavigationBarButton {
    let title: String?
    let image: UIImage?
    let action: Selector
}

extension UIViewController {
    
    func configureNavigationBar(
        title: String,
        prefersLargeTitle: Bool = false,
        leftButton: NavigationBarButton? = nil,
        rightButton: NavigationBarButton? = nil,
        target: AnyObject? = nil
    ) {
        self.title = title
        
        navigationController?.navigationBar.prefersLargeTitles = prefersLargeTitle
        
        if let left = leftButton {
            navigationItem.leftBarButtonItem = UIBarButtonItem(
                title: left.title,
                image: left.image,
                target: target ?? self,
                action: left.action
            )
        }
        
        if let right = rightButton {
            navigationItem.rightBarButtonItem = UIBarButtonItem(
                title: right.title,
                image: right.image,
                target: target ?? self,
                action: right.action
            )
        }
    }
}
