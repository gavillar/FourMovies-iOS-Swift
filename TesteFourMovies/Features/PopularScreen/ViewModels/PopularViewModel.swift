//
//  PopularViewModel.swift
//  TesteFourMovies
//
//  Created by user220831 on 9/29/22.
//

import Foundation
import Core

class PopularViewModel: PopularViewModelProtocol {
    
    var popular = Bindable<ModelState<[PopularItemCellViewModelProtocol]>>(.none)
    
    private let manager: PopularManager
    private let presenter: PopularPresenter
    
    var cachedData: [MovieResultPopular] = []
    
    required init(provider: PopularProviderProtocol,
                  presenter: PopularPresenter) {
        self.manager = PopularManager(provider: provider)
        self.presenter = presenter
    }
    
    
    func fetch() {
        manager.getMovies { [weak self] result, statusCode in
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                self.cachedData = [data]
                
                let models = self.cachedData.first?.results.enumerated().compactMap({ index, movies -> PopularItemCellViewModel in
                        
                    return PopularItemCellViewModel(movies: movies)
                    })
                
                self.popular.value = .finished(models ?? [])
                          
            case .failure(let error):
                print("error \(error)")
                self.popular.value = .failed
            }
            
        }
        
    }
}
