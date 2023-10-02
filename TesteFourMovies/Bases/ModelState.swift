//
//  ModelState.swift
//  TesteFourMovies
//
//  Created by Digital Offer on 01/10/23.
//

import Foundation

public enum ModelState<Model> {
    case none
    case loading
    case finished(Model)
    case failed
    
    public var value: Model? {
        switch self {
        case .finished(let model):
            return model
        default:
            return nil
        }
    }
}
