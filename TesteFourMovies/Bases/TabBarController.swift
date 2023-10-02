//
//  TabBarController.swift
//  TesteFourMovies
//
//  Created by Digital Offer on 01/10/23.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self

        if #available(iOS 15.0, *) {

            let appearance = UITabBarAppearance()
            appearance.shadowImage = UIImage()
            appearance.shadowColor = .white
            appearance.stackedLayoutAppearance.normal.iconColor = .gray
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.blue,
                                                                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .semibold)]
        
            appearance.stackedLayoutAppearance.normal.badgeBackgroundColor = .cyan

            appearance.stackedLayoutAppearance.normal.badgeTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.red]

            appearance.stackedLayoutAppearance.selected.iconColor = UIColor.purple

            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                                                               NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .bold)
            ]

            appearance.backgroundColor = .gray

            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = appearance
        }
    }
}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        (viewController as? UINavigationController)?.popToRootViewController(animated: true)
    }
}
