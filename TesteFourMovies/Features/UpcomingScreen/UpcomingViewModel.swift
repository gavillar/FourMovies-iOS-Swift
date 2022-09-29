//
//  UpcomingViewModel.swift
//  TesteFourMovies
//
//  Created by user220831 on 9/28/22.
//

import Foundation

protocol UpcomingProtocol {
    func getMovieData(data: [Result])
    
    
}

class UpcomingViewModel {
    
    var upcomingDelegate: UpcomingProtocol?
    

    func getMovies() {
    
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=644c3fb568510b2779c8f2b277ed5f25&language=en-US&page=1")!)){
            (data,req,error) in
            do {
                let result = try JSONDecoder().decode(MovieResult.self, from: data!)
                
                    self.upcomingDelegate?.getMovieData(data: result.results)
        
            } catch {
                print(error)
            }
            
        }.resume()
        
    }
    
  
    
    
    init() {
      getMovies()
        
    }
    
    
    
    
}
