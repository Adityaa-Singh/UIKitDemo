//
//  LaunchModuleBuilder.swift
//  UIKitDemo
//
//  Created by Kamal Saini on 06/11/26.
//

import Foundation

import UIKit

enum LaunchModuleBuilder {

    static func build() -> UIViewController {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let view = storyboard.instantiateViewController(
            withIdentifier: "LaunchViewController"
        ) as? LaunchViewController else {
            // Fallback if storyboard instantiation fails
            return UIViewController()
        }
        
       // let view = LaunchViewController()

        let presenter = LaunchPresenter()

        let interactor = LaunchInteractor()

        let router = LaunchRouter()

        // View -> Presenter
        view.presenter = presenter

        // Presenter -> View
        presenter.view = view

        // Presenter -> Interactor
        presenter.interactor = interactor

        // Presenter -> Router
        presenter.router = router

        // Interactor -> Presenter
        interactor.presenter = presenter

        return view
    }
}
