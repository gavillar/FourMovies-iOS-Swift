//
//  PopularViewModelProtocol.swift
//  TesteFourMovies
//
//  Created by Digital Offer on 29/09/23.
//

import Foundation

protocol PopularViewModelProtocol {
    var count: Int { get }
    func fetch()
}
