//
//  PopularManager.swift
//  TesteFourMovies
//
//  Created by Digital Offer on 29/09/23.
//

import Foundation
import Core
import Alamofire

class PopularManager: Manager {
    
    // MARK: Properties
    private let provider: PopularProviderProtocol
    
    init(provider: PopularProviderProtocol) {
        self.provider = provider
    }
    
    func getMovies(completion: @escaping PopularCompletion) {
        cancelAllOperations()
        
        let operation = PopularOperation(provider: provider) { result, statusCode in
            OperationQueue.main.addOperation { completion(result, statusCode) }
        }
        
        addOperation(operation)
    }
}
