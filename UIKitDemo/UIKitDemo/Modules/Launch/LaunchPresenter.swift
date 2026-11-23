//
//  LaunchPresenter.swift
//  UIKitDemo
//
//  Created by Kamal Saini on 06/11/26.
//

import Foundation

protocol LaunchPresenterProtocol: AnyObject {
    func viewDidLoad()
}

final class LaunchPresenter: LaunchPresenterProtocol {

    weak var view: LaunchViewProtocol?

    var interactor: LaunchInteractorProtocol?
    var router: LaunchRouterProtocol?

    func viewDidLoad() {

        view?.showLoading()

        interactor?.checkAppStatus()
    }
}

// MARK: - Interactor Output

extension LaunchPresenter: LaunchInteractorOutputProtocol {

    func appStatusChecked() {

        guard let view = view else {
            return
        }

        view.hideLoading()

        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.router?.navigateToHome(from: view)
        }
    }
}
