//
//  PresenterProtocol.swift
//  TesteFourMovies
//
//  Created by Digital Offer on 01/10/23.
//

import Foundation

protocol PresenterProtocol: AnyObject {
    func back()
    func finish()
    func backToRoot()
    func addChildPresenter(_ presenter: Presenter)
    func removeChildPresenter(_ presenter: Presenter)
}
