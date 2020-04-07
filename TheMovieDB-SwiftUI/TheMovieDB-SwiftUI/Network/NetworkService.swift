//
//  NetworkService.swift
//  TheMovieDB-SwiftUI
//
//  Created by Ronald Maciel on 03/04/20.
//  Copyright © 2020 Ronald Maciel. All rights reserved.
//

import Foundation
import UIKit



enum MovieCategory {
    case POPULAR
    case NOWPLAYING
    
}

enum ResultError: String, Error {
    case invalidUsername = "This username created an invalid request. Please try again."
    case unableToComplete = "Unable to completed your request. Please check your internet connection."
    case invalidResponse = "Invalid response from server. Please try again"
    case invalidData = "The data received from the server is invalid. Please try again"
}


struct MoviesResults: Decodable {
    var results: [Movie]
}

class Network {
    let API_KEY = "03dd234794b7f1722e3c3bc7a585f7a7"
    
    static var sharedInstance = Network()
    
    let cache = NSCache<NSString, UIImage>()
    
    
    let popularBaseURL: String = "https://api.themoviedb.org/3/movie/now_playing?api_key="
    let nowPlayingBaseURL: String = "https://api.themoviedb.org/3/movie/popular?api_key="
    
    
    func fetchMovies(with category: MovieCategory, completion: @escaping (Result<[Movie], ResultError>) -> Void) {
        var urlString = ""
        
        if (category == .POPULAR) {
            urlString = "\(popularBaseURL)\(API_KEY)"
        } else if (category == .NOWPLAYING) {
            urlString = "\(nowPlayingBaseURL)\(API_KEY)"
        }
        
        guard let URL = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: URL) { (data, response, err) in
            if let _ = err {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
                
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                var movies: [Movie] = []
                      
                if let results = try? decoder.decode(MoviesResults.self, from: data) {
                    movies = results.results
                }
                
                completion(.success(movies))
            } catch {
                completion(.failure(.invalidData))
            }
            
        }
        
        task.resume()
    }
    
}
