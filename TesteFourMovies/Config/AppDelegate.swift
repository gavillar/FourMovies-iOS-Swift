//
//  AppDelegate.swift
//  TesteFourMovies
//
//  Created by user220210 on 9/27/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var presenter: PresenterProtocol?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        start()
        
        return true
    }
    
    private func start() {
        guard let window = window else {
            let window = UIWindow(frame: UIScreen.main.bounds)
            self.window = window
            return start()
        }
        
        let presenter = OffboardPresenter(providersFactory: ProvidersFactory(), parentPresenter: self)
        presenter.start(window: window)
    }
}

extension AppDelegate: PresenterProtocol {
    
    func back() {}
    
    func addChildPresenter(_ presenter: Presenter) {
        self.presenter = presenter
    }
    
    func removeChildPresenter(_ presenter: Presenter) {
        self.presenter = nil
    }
    
    func finish() {
        presenter?.backToRoot()
    }
    
    func backToRoot() {
       // session.destroy()
        start()
    }
}


