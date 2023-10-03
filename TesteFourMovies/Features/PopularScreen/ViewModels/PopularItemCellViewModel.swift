//
//  PopularItemCellViewModel.swift
//  TesteFourMovies
//
//  Created by Digital Offer on 01/10/23.
//

import Foundation
import Core
import SDWebImage


class PopularItemCellViewModel: PopularItemCellViewModelProtocol {
    
    var movieImage = Bindable<UIImage?>(nil)
    var movieName = Bindable<String?>(nil)
    var movieDate = Bindable<String?>(nil)
    
    required init(movies: ResultPopular) {
            self.movieName.value = movies.title
            self.movieDate.value = movies.releaseDate
        
            convertImage(movies: movies)
        }
    
    private func convertImage(movies: ResultPopular) {
        
        if let imageUrlString = movies.posterPath,
           let imageUrl = URL(string: "https://image.tmdb.org/t/p/w342\(imageUrlString)") {
            SDWebImageManager.shared.loadImage(with: imageUrl, options: [], progress: nil) { [weak self] (image, _, _, _, _, _) in
                guard let self = self else { return }
                if let image = image,
                   let imageData = image.pngData() {
                    _ = imageData.base64EncodedString()
                    self.movieImage.value = image
                }
            }
    }
    }
}
