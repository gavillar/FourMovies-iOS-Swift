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
    
    var upcomingProvider: UpcomingProviderProtocol { UpcomingProvider() }
}

extension ProvidersFactory: PopularProviderFactoryProtocol {
    var onboardProviderFactory: OnboardProviderFactoryProtocol { ProvidersFactory() }
    
    var popularFactory: PopularProviderFactoryProtocol { ProvidersFactory() }
}


extension ProvidersFactory: UpcomingProviderFactoryProtocol {
    var upcomingFactory: UpcomingProviderFactoryProtocol { ProvidersFactory() }
}

