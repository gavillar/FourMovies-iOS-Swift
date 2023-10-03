//
//  PopularProviderProtocol.swift
//  TesteFourMovies
//
//  Created by Digital Offer on 29/09/23.
//

import Foundation
import Core

typealias PopularCompletion = (Result<MovieResultPopular, Error>, Int) -> Void

protocol PopularProviderProtocol {
    func getMovies(completion: @escaping PopularCompletion)
}
 
