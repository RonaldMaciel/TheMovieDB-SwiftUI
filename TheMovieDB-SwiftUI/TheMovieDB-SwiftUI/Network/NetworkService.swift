//
//  NetworkService.swift
//  TheMovieDB-SwiftUI
//
//  Created by Ronald Maciel on 03/04/20.
//  Copyright © 2020 Ronald Maciel. All rights reserved.
//

import Foundation
import UIKit

class Network {
    let API_KEY = "03dd234794b7f1722e3c3bc7a585f7a7"
    
    static var sharedInstance = Network()
    
    let cache = NSCache<NSString, UIImage>()
    
    
    let popularBaseURL: String = "https://api.themoviedb.org/3/movie/now_playing?api_key="
    let nowPlayingBaseURL: String = "https://api.themoviedb.org/3/movie/popular?api_key="
    
    
    
    
}
