//
//  PopularViewModel.swift
//  TesteFourMovies
//
//  Created by user220831 on 9/29/22.
//

import Foundation

class PopularViewModel: PopularViewModelProtocol {
    
    private let manager: PopularManager
    private let presenter: PopularPresenter
    
    required init(provider: PopularProviderProtocol,
                  presenter: PopularPresenter) {
        self.manager = PopularManager(provider: provider)
        self.presenter = presenter
    }
    
    
    func fetch() {
        manager.getMovies { result, statusCode in
            
            print("result \(result)")
        }
    }
    
    //MARK: - constants
    
    var dataList = [ResultMovies]()
    
    var count: Int {
        return self.dataList.count
    }
 
}
