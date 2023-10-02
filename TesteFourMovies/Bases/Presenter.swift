//
//  Presenter.swift
//  TesteFourMovies
//
//  Created by Digital Offer on 01/10/23.
//

import UIKit

class Presenter: PresenterProtocol, Hashable {

    static func == (lhs: Presenter, rhs: Presenter) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    private let id = UUID()

    private(set) weak var currentController: UIViewController?
    private(set) var parentPresenter: PresenterProtocol?
    private var childPresenters: Set<Presenter>

    init(parentPresenter: PresenterProtocol?) {
        self.parentPresenter = parentPresenter

        self.childPresenters = []
        parentPresenter?.addChildPresenter(self)
    }

    func setCurrentController(_ controller: UIViewController) {
        currentController = controller
    }

    func back() {
        if case let navigationController as UINavigationController = currentController, navigationController.viewControllers.count > 1 {
            navigationController.popViewController(animated: true)
            return
        }

        finish()
    }

    func finish() {
        currentController?.dismiss(animated: false, completion: nil)
        parentPresenter?.removeChildPresenter(self)
    }

    func removeChildPresenter(_ presenter: Presenter) {
        childPresenters.remove(presenter)
    }

    func backToRoot() {
        finish()

        childPresenters.forEach { $0.finish() }
        parentPresenter?.backToRoot()
    }

    func addChildPresenter(_ presenter: Presenter) {
        childPresenters.insert(presenter)
    }
}
