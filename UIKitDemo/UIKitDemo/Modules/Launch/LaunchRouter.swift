//
//  LaunchRouter.swift
//  UIKitDemo
//
//  Created by Kamal Saini on 06/11/26.
//

import Foundation
import UIKit

// MARK: - Router
protocol LaunchRouterProtocol: AnyObject {
    func navigateToHome(from view: LaunchViewProtocol)
}

class LaunchRouter : LaunchRouterProtocol{
    
    func navigateToHome(from view: LaunchViewProtocol) {
        
        guard let viewController = view as? UIViewController else {
            return
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let loginViewController = storyboard.instantiateViewController(
            withIdentifier: "LoginViewController"
        ) as? LoginViewController else {
            return
        }
        loginViewController.navigationItem.hidesBackButton = true
        viewController.navigationController?.setViewControllers(
            [loginViewController],
            animated: true
        )
    }
}
