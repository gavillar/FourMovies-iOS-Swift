//
//  PopularProviderProtocol.swift
//  TesteFourMovies
//
//  Created by Digital Offer on 29/09/23.
//

import Foundation
import Core
import Alamofire

typealias PopularCompletion = (Result<MovieResult, AFError>, Int) -> Void

protocol PopularProviderProtocol {
    func getMovies(completion: @escaping PopularCompletion)
}
 
