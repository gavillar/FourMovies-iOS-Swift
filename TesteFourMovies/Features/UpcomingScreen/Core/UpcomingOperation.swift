//
//  UpcomingOperation.swift
//  TesteFourMovies
//
//  Created by Digital Offer on 03/10/23.
//

import Foundation
import Core
 
class UpcomingOperation: AsyncOperation {
    
    // MARK: Properties
    
    private let provider: UpcomingProviderProtocol
    private let completion: UpcomingCompletion
    
    required init(provider: UpcomingProviderProtocol, completion: @escaping UpcomingCompletion) {
        self.provider = provider
        self.completion = completion
    }
    
    // MARK: Main
    override func main() {
        
        provider.getMovies { [weak self] result, statusCode in
            guard let self = self else { return }
            
            self.completion(result, statusCode)
            self.finish()
            
        }
    }
}
