//
//  OnboardProviderFactoryProtocol.swift
//  TesteFourMovies
//
//  Created by Digital Offer on 01/10/23.
//

import Foundation

protocol OnboardProviderFactoryProtocol {
    var popularProvider: PopularProviderProtocol { get }
    var popularFactory: PopularProviderFactoryProtocol { get }
}