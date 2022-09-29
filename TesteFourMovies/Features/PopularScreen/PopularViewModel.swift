//
//  PopularViewModel.swift
//  TesteFourMovies
//
//  Created by user220831 on 9/29/22.
//

import Foundation


protocol PopularProtocol {
    func getMovieData(data: [Result])
    
    
}

class PopularViewModel {
    
    var popularDelegate: PopularProtocol?
    

    func getMovies() {
    
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=644c3fb568510b2779c8f2b277ed5f25&language=en-US&page=1")!)){
            (data,req,error) in
            do {
                let decoder = JSONDecoder()
             
                
                let result = try decoder.decode(MovieResult.self, from: data!)
                print(result)
                    self.popularDelegate?.getMovieData(data: result.results ?? [])
        
            } catch {
                print(error)
            }
            
        }.resume()
        
    }
    
  
    
    
    init() {
      getMovies()
        
    }
    
    
    
    
}
