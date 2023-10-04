//
//  PopularPresenter.swift
//  TesteFourMovies
//
//  Created by Digital Offer on 01/10/23.
//

import Foundation
import UIKit


class PopularPresenter: Presenter, PopularPresenterProtocol {
    
    var window: UIWindow?
    private let providerFactory: PopularProviderFactoryProtocol
    
    required init(providerFactory: PopularProviderFactoryProtocol, parentPresenter: PresenterProtocol?) {
        self.providerFactory = providerFactory
        super.init(parentPresenter: parentPresenter)
    }
    
    // MARK: Public methods
    
    func start(window: UIWindow) {
        guard let controller = buildController() else { return }
        
        window.rootViewController = controller
        window.makeKeyAndVisible()
        setCurrentController(controller)
        
        self.window = window
    }
    
    func start(fromController: UIViewController) {
        guard let controller = buildController() else { return }
        
        fromController.present(controller, animated: true, completion: nil)
        setCurrentController(controller)
    }
    
    func presentPopular() {
        guard let controller = currentController else { return }

        let presenter = OnboardPresenter(providersFactory: providerFactory.onboardProviderFactory, parentPresenter: self)
        presenter.start(fromController: controller)
    }
    
    // MARK: Private methods
    
    private func buildController() -> UIViewController? {
        let controller = PopularViewController()

        let viewModel = PopularViewModel(provider: providerFactory.popularProvider, presenter: self)
        controller.viewModel = viewModel
        
        
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.modalPresentationStyle = .overCurrentContext
        navigationController.modalTransitionStyle = .crossDissolve
        
        return navigationController
    }
    
    
    func start(tabBarController: UITabBarController) {

            let controller = PopularViewController()

        let viewModel = PopularViewModel(provider: providerFactory.popularProvider, presenter: self)

            controller.title = "Popular"
            controller.viewModel = viewModel

            let navigationController = UINavigationController(rootViewController: controller)
            navigationController.tabBarItem = UITabBarItem(title: "Popular", image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"))

            tabBarController.addChild(navigationController)

            setCurrentController(navigationController)
    }
    
}
