//
//  HomeViewController.swift
//  UIKitDemo
//
//  Created by Kamal Saini on 06/11/26.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    
    private func setupUI() {
        
        view.backgroundColor = .systemRed
        title = "Home"
    }
}
