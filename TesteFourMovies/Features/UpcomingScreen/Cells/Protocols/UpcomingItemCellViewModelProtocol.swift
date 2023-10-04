//
//  UpcomingItemCellViewModelProtocol.swift
//  TesteFourMovies
//
//  Created by Digital Offer on 04/10/23.
//

import Foundation
import Core
import UIKit


protocol UpcomingItemCellViewModelProtocol {
    
    var movieImage: Bindable<UIImage?> { get }
    var movieName: Bindable<String?> { get }
    var movieDate: Bindable<String?> { get }
    
}
