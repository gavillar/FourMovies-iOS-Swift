//
//  PopularProvider.swift
//  TesteFourMovies
//
//  Created by Digital Offer on 29/09/23.
//

import Foundation
import Alamofire

class PopularProvider: PopularProviderProtocol {
    func getMovies(completion: @escaping PopularCompletion) {
        
        let url = "https://api.themoviedb.org/3/movie/popular?api_key=644c3fb568510b2779c8f2b277ed5f25&language=en-US&page=1"
        let permissionPath = "Popular"
        let headers: HTTPHeaders = ["accept": "application/json"]
        
        AF.request(url,
                   method: .get,
                   encoding: JSONEncoding.default,
                   headers: headers).responseDecodable(of: MovieResult.self) { response in
            
            let statusCode = response.response?.statusCode ?? .zero
            
            switch response.result {
            case .success(let value):
                DataLogger.log(path: permissionPath,
                                statusCode: statusCode,
                                headers: response.request?.headers.dictionary ?? [:],
                                response: response.response,
                                responseValue: value)
                completion(.success(value), statusCode)
            case .failure(let error):
                DataLogger.log(path: permissionPath,
                                statusCode: statusCode,
                                headers: response.request?.headers.dictionary ?? [:],
                                response: response.response,
                                responseValue: error)
                completion(.failure(error), statusCode)
            }
        }
    }
}


