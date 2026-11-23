//
//  ViewController.swift
//  UIKitDemo
//
//  Created by Kamal Saini on 06/11/26.
//

import UIKit

// MARK: - View
protocol LaunchViewProtocol: AnyObject {
    func showLoading()
    func hideLoading()
}

class LaunchViewController: UIViewController,
                            LaunchViewProtocol {
    
    var presenter: LaunchPresenterProtocol?
    
    private let activityIndicator = UIActivityIndicatorView(
        style: .large
    )
    
    // MARK: - UI Components
    private let parentView = UIView()
    private let logoImg = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setUpConstraints()
        setUpComponents()
        presenter?.viewDidLoad()
    }
    
    private func setupUI() {
        
        navigationController?.isNavigationBarHidden = true
        parentView.backgroundColor = UIColor.appBackground
        
        view.addSubview(parentView)
        parentView.addSubview(logoImg)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        parentView.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(
                equalTo: parentView.centerXAnchor
            ),
            
            activityIndicator.centerYAnchor.constraint(
                equalTo: parentView.centerYAnchor
            )
        ])
    }
    
    
    func setUpConstraints() {
        
        parentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            parentView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            
            parentView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),
            
            parentView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            
            parentView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            )
        ])
        
        // logoImg
        logoImg.translatesAutoresizingMaskIntoConstraints = false
        logoImg.centerXAnchor.constraint(equalTo: self.parentView.centerXAnchor).isActive = true
        logoImg.centerYAnchor.constraint(equalTo: self.parentView.centerYAnchor).isActive = true
        logoImg.heightAnchor.constraint(equalToConstant: 200).isActive = true
        logoImg.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
    
    func setUpComponents() {
        logoImg.image = UIImage(named: "LEGO_logo")
    }
    
    // MARK: - LaunchViewProtocol
    
    func showLoading() {
        activityIndicator.startAnimating()
    }
    
    func hideLoading() {
        activityIndicator.stopAnimating()
    }

}
