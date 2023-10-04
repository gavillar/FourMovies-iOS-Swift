//
//  UpcomingViewModel.swift
//  TesteFourMovies
//
//  Created by user220831 on 9/28/22.
//

import Foundation
import Core


class UpcomingViewModel: UpcomingViewModelProtocol {
    
    private let manager: UpcomingManager
    private let presenter: UpcomingPresenter
    
    required init(provider: UpcomingProviderProtocol, presenter: UpcomingPresenter) {
        self.manager = UpcomingManager(provider: provider)
        self.presenter = presenter
        
    }
    
    var upcoming = Bindable<ModelState<[UpcomingItemCellViewModelProtocol]>>(.none)
    
    var cachedData: [MovieResultUpcoming] = []
    
    func fetch() {
        
        manager.getMovies { [weak self] result, statusCode in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.cachedData = [data]
                
                let models = self.cachedData.first?.results?.enumerated().compactMap { index, movies -> UpcomingItemCellViewModel in
                    
                    return UpcomingItemCellViewModel(movies: movies)
                }
                
                self.upcoming.value = .finished(models ?? [])
                
            case .failure(let error): 
                print("error \(error)")
                self.upcoming.value = .failed
            }
            
        }
    
    }
    
    
 
    
}
