//
//  UpcomingItemCellViewModel.swift
//  TesteFourMovies
//
//  Created by Digital Offer on 04/10/23.
//

import Foundation
import Core
import UIKit
import SDWebImage


class UpcomingItemCellViewModel: UpcomingItemCellViewModelProtocol   {
    
    
    var movieImage = Bindable<UIImage?>(nil)
    var movieName = Bindable<String?>(nil)
    var movieDate = Bindable<String?>(nil)
    
    required init(movies: ResultUpcoming) {
            self.movieName.value = movies.title
            self.movieDate.value = movies.releaseDate
        
            convertImage(movies: movies)
        }
    
    private func convertImage(movies: ResultUpcoming) {
        
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
