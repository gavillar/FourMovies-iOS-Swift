//
//  ProvidersFactory.swift
//  TesteFourMovies
//
//  Created by Digital Offer on 01/10/23.
//

import Foundation


struct ProvidersFactory: PopularProviderFactoryProtocol, UpcomingProviderFactoryProtocol {
    
    
    var onboardProviderFactory: OnboardProviderFactoryProtocol {
        return ProvidersFactory()
    }
}

extension ProvidersFactory: OnboardProviderFactoryProtocol {
    
    
    var popularProvider: PopularProviderProtocol {
        return PopularProvider()
    }
    
    var popularFactory: PopularProviderFactoryProtocol {
        return self
    }
    
    var upcomingProvider: UpcomingProviderProtocol {
        return UpcomingProvider()
    }
    
    var upcomingFactory: UpcomingProviderFactoryProtocol {
        self
    }
}


    
  
