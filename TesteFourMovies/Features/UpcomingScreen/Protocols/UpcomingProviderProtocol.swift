//
//  UpcomingProviderProtocol.swift
//  TesteFourMovies
//
//  Created by Digital Offer on 03/10/23.
//

import Foundation

typealias UpcomingCompletion = (Result<MovieResultUpcoming, Error>, Int) -> Void

protocol UpcomingProviderProtocol {
    func getMovies(completion: @escaping UpcomingCompletion)
}
