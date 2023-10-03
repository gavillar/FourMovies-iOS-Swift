//
//  OnboardingPresenter.swift
//  TesteFourMovies
//
//  Created by Digital Offer on 01/10/23.
//

import Foundation
import UIKit

class OnboardPresenter: Presenter {
    
    // MARK: Properties
    
    private let providersFactory: OnboardProviderFactoryProtocol
    
    // MARK: Initializer
    
    required init( providersFactory: OnboardProviderFactoryProtocol, parentPresenter: PresenterProtocol?) {
        self.providersFactory = providersFactory
        super.init(parentPresenter: parentPresenter)
    }
    
    // MARK: Public methods
    
    func start(window: UIWindow) {
        let tabBarController = buildTabBarController()
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
    
    func start(fromController: UIViewController) {
        let tabBarController = buildTabBarController()
        fromController.present(tabBarController, animated: true, completion: nil)
    }
    
    // MARK: Private methods
    
    private func buildTabBarController() -> UITabBarController {
        let tabBarController = TabBarController()
        tabBarController.modalPresentationStyle = .overCurrentContext
        tabBarController.modalTransitionStyle = .crossDissolve
        
        setCurrentController(tabBarController)
        
        presentPopular(tabBarController: tabBarController)
        presentUpcoming(tabBarController: tabBarController)
        
        return tabBarController
    }
    
    private func presentPopular(tabBarController: UITabBarController) {
        let popularPresenter = PopularPresenter(providerFactory: providersFactory.popularFactory,
                                                parentPresenter: self)
        popularPresenter.start(tabBarController: tabBarController)
    }
    
    private func presentUpcoming(tabBarController: UITabBarController) {
        let upcomingPresenter = UpcomingPresenter(providerFactory: providersFactory.upcomingFactory,
                                                  parentPresenter: self)
        upcomingPresenter.start(tabBarController: tabBarController)
    }
}

