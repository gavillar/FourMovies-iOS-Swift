//
//  PopularViewModelProtocol.swift
//  TesteFourMovies
//
//  Created by Digital Offer on 29/09/23.
//

import Foundation
import Core

protocol PopularViewModelProtocol {
    var popular: Bindable<ModelState<[PopularItemCellViewModelProtocol]>> { get }
    var cachedData: [MovieResult] { get }
    func fetch()
}

