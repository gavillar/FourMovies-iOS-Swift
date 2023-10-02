//
//  PopularOperation.swift
//  TesteFourMovies
//
//  Created by Digital Offer on 29/09/23.
//

import Foundation
import Core

class PopularOperation: AsyncOperation {
    
    // MARK: Properties
    
    private let provider: PopularProviderProtocol
    private let completion: PopularCompletion
    
    // MARK: Initializer
    required init(provider: PopularProviderProtocol, completion: @escaping PopularCompletion) {
        self.provider = provider
        self.completion = completion
        super.init()
        
        
    }
    
    // MARK: Main
    override func main() {
        super.main()
        
        provider.getMovies() { [weak self ] result, statusCode in
            guard let self = self else { return }
            
            self.completion(result, statusCode)
            self.finish()
        }
    }
}

