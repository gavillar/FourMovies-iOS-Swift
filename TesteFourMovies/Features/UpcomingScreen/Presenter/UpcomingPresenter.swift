//
//  UpcomingPresenter.swift
//  TesteFourMovies
//
//  Created by Digital Offer on 03/10/23.
//

import Foundation
import UIKit

class UpcomingPresenter: Presenter, UpcomingPresenterProtocol {
    
    private let providerFactory: UpcomingProviderFactoryProtocol
    
    required init(providerFactory: UpcomingProviderFactoryProtocol, parentPresenter: PresenterProtocol?) {
        self.providerFactory = providerFactory
        super.init(parentPresenter: parentPresenter)
    }
    
    
    func start(tabBarController: UITabBarController) {

            let controller = UpcomingViewController()

            let viewModel = UpcomingViewModel(provider: providerFactory.upcomingProvider, presenter: self)

            controller.title = "Upcoming"
            controller.viewModel = viewModel

            let navigationController = UINavigationController(rootViewController: controller)
            navigationController.tabBarItem = UITabBarItem(title: "Upcoming", image: UIImage(systemName: "film"), selectedImage: UIImage(systemName: "film"))

            tabBarController.addChild(navigationController)

            setCurrentController(navigationController)
    }
    
}
