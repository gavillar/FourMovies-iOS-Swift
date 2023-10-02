//
//  PopularProviderFactoryProtocol.swift
//  TesteFourMovies
//
//  Created by Digital Offer on 01/10/23.
//

import Foundation


protocol PopularProviderFactoryProtocol {
    var popularProvider: PopularProviderProtocol { get }
    var onboardProviderFactory: OnboardProviderFactoryProtocol { get }
}
