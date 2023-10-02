//
//  OffboardingPresenter.swift
//  TesteFourMovies
//
//  Created by Digital Offer on 01/10/23.
//

import UIKit
import Foundation

class OffboardPresenter: Presenter {
    
    // MARK: Properties
    
    private let providersFactory: OnboardProviderFactoryProtocol
    
    // MARK: Initializer
    
    required init(providersFactory: OnboardProviderFactoryProtocol, parentPresenter: PresenterProtocol?) {
        self.providersFactory = providersFactory
        super.init(parentPresenter: parentPresenter)
    }
    
    // MARK: Start
    
    func start(window: UIWindow) {
      
        let presenter = OnboardPresenter(providersFactory: providersFactory, parentPresenter: self)
        
        
       // let presenter = PopularPresenter(providerFactory: providersFactory.popularFactory, parentPresenter: self)
        
        return presenter.start(window: window)
    }
}




//import UIKit
//
//class OffboardPresenter: Presenter {
//
//    // MARK: Properties
//
//    private let providersFactory: OnboardProviderFactory
//
//    // MARK: Initializer
//
//    required init(session: AppSessionProtocol?, providersFactory: OnboardProviderFactory, parentPresenter: PresenterProtocol?) {
//        self.providersFactory = providersFactory
//        super.init(session: session, parentPresenter: parentPresenter)
//    }
//
//    // MARK: Start
//
//    func start(window: UIWindow) {
//        if session?.hasSelectedStore ?? false {
//            let presenter = OnboardPresenter(session: session, providersFactory: providersFactory, parentPresenter: self)
//            return presenter.start(window: window)
//        }
//
//        let presenter = StoresPresenter(session: session, providersFactory: providersFactory.storesFactory, parentPresenter: self)
//        return presenter.start(window: window)
//    }
//}
