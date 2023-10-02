//
//  ProvidersFactory.swift
//  TesteFourMovies
//
//  Created by Digital Offer on 01/10/23.
//

import Foundation


struct ProvidersFactory {}

extension ProvidersFactory: OnboardProviderFactoryProtocol {
    var popularProvider: PopularProviderProtocol { PopularProvider() }
}

extension ProvidersFactory: PopularProviderFactoryProtocol {
    var onboardProviderFactory: OnboardProviderFactoryProtocol { ProvidersFactory() }
    
    var popularFactory: PopularProviderFactoryProtocol { ProvidersFactory() }
}
