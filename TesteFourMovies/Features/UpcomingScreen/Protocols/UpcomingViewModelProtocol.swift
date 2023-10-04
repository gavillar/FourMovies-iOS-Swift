//
//  UpcomingViewModelProtocol.swift
//  TesteFourMovies
//
//  Created by Digital Offer on 03/10/23.
//

import Foundation
import Core

protocol UpcomingViewModelProtocol {
    var upcoming: Bindable<ModelState<[UpcomingItemCellViewModelProtocol]>> { get }
    var cachedData: [MovieResultUpcoming] { get }
    func fetch()
}
