//
//  UpcomingProviderFactoryProtocol.swift
//  TesteFourMovies
//
//  Created by Digital Offer on 03/10/23.
//

import Foundation

protocol UpcomingProviderFactoryProtocol {
    var upcomingProvider: UpcomingProviderProtocol { get }
    var onboardProviderFactory: OnboardProviderFactoryProtocol { get }
}
