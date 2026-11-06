//
//  NavigationBarAppearance.swift
//  Aditya Tes
//
//  Created by Kamal Saini on 04/05/26.
//

import Foundation
import UIKit

final class NavigationBarAppearance {
    
    static func setup() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        // Background color
        appearance.backgroundColor = .systemBlue
        
        // Title style
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font:  UIFont(name: App.Font.medium, size: App.FontSize.medium) ?? UIFont.systemFont(ofSize: 20, weight: .semibold)
        ]
        
        // Large title style
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont(name: App.Font.semiBold, size: App.FontSize.mediumLarge) ?? UIFont.systemFont(ofSize: 32, weight: .bold)
        ]
        
        // Remove shadow line
        appearance.shadowColor = .clear
        
        let navigationBar = UINavigationBar.appearance()
        navigationBar.tintColor = .white
        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
        navigationBar.compactAppearance = appearance
        navigationBar.prefersLargeTitles = false
    }
}
