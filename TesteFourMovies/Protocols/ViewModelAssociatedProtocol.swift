//
//  ViewModelAssociatedProtocol.swift
//  TesteFourMovies
//
//  Created by Digital Offer on 01/10/23.
//

import Foundation


protocol ViewModelAssociatedProtocol {
    
    associatedtype ViewModel
    
    var viewModel: ViewModel? { get set }
}
