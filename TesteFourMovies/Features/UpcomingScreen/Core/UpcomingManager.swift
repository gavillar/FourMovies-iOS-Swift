//
//  UpcomingManager.swift
//  TesteFourMovies
//
//  Created by Digital Offer on 03/10/23.
//

import Foundation
import Core
import Alamofire

class UpcomingManager: Manager {
    
    private let provider: UpcomingProviderProtocol
    
    
    init(provider: UpcomingProviderProtocol) {
        self.provider = provider
    }
    
    
    func getMovies(completion: @escaping UpcomingCompletion) {
        
        let operation = UpcomingOperation(provider: provider) { result, statusCode in
            
            OperationQueue.main.addOperation { completion(result, statusCode) }
            
        }
        
        addOperation(operation)
    }
}
