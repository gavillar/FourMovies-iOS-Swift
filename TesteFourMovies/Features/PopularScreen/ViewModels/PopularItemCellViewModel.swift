//
//  PopularItemCellViewModel.swift
//  TesteFourMovies
//
//  Created by Digital Offer on 01/10/23.
//

import Foundation
import Core


class PopularItemCellViewModel: PopularItemCellViewModelProtocol {
    
    var movieImage = Bindable<String?>(nil)
    var movieName = Bindable<String?>(nil)
    var movieDate = Bindable<String?>(nil)
    
    required init(movies: MovieResult) {
        self.movieImage.value = movies.results?.first?.posterPath
        self.movieName.value = movies.results?.first?.title
        self.movieDate.value = movies.results?.first?.releaseDate
    }
}
