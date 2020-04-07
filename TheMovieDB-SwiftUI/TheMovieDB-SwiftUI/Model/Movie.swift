//
//  Movie.swift
//  TheMovieDB-SwiftUI
//
//  Created by Ronald Maciel on 03/04/20.
//  Copyright © 2020 Ronald Maciel. All rights reserved.
//

import Foundation
import UIKit


struct Movie: Hashable, Codable {
    var id = UUID()
    var title: String
    var overview: String
    var genres: String
    var vote_average: Double
    var poster_path: String
    
}


extension Movie: Identifiable { }
