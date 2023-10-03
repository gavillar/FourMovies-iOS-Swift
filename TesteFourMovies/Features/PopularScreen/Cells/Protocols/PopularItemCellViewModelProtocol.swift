//
//  PopularItemCellViewModelProtocol.swift
//  TesteFourMovies
//
//  Created by Digital Offer on 01/10/23.
//

import Foundation
import Core
import UIKit

protocol PopularItemCellViewModelProtocol {
    
    var movieImage: Bindable<UIImage?> { get }
    var movieName: Bindable<String?> { get }
    var movieDate: Bindable<String?> { get }
    
    
}
