//
//  LaunchInteractor.swift
//  UIKitDemo
//
//  Created by Kamal Saini on 06/11/26.
//

import Foundation

// MARK: - Interactor Output
protocol LaunchInteractorOutputProtocol: AnyObject {
    func appStatusChecked()
}

// MARK: - Interactor
protocol LaunchInteractorProtocol: AnyObject {
    func checkAppStatus()
}

class LaunchInteractor: LaunchInteractorProtocol {
    
    weak var presenter: LaunchInteractorOutputProtocol?

    
    func checkAppStatus() {
        self.presenter?.appStatusChecked()
    }
    
    
}
