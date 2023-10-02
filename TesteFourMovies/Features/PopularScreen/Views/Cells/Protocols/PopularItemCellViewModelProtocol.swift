//
//  PopularItemCellViewModelProtocol.swift
//  TesteFourMovies
//
//  Created by Digital Offer on 01/10/23.
//

import Foundation
import Core

protocol PopularItemCellViewModelProtocol {
    
    var movieImage: Bindable<String?> { get }
    var movieName: Bindable<String?> { get }
    var movieDate: Bindable<String?> { get }
    
    
}
