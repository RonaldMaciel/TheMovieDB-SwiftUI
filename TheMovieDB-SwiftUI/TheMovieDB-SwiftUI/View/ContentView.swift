//
//  ContentView.swift
//  TheMovieDB-SwiftUI
//
//  Created by Ronald Maciel on 03/04/20.
//  Copyright © 2020 Ronald Maciel. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var popularMovies: [Movie] = []
    @State var nowPlayingMovies: [Movie] = []
    
    
    var body: some View {
        NavigationView {
            ListMovies
        }
        .onAppear() {
            
            Network.sharedInstance.fetchMovies(with: .POPULAR, completion: { result in
                switch result {
                case .success(let movies):
                    DispatchQueue.main.async {
                        self.popularMovies = movies
                        print(self.popularMovies.count)
                    }
                case .failure(_):
                    print("fail")
                }
            })
        }
    }
    
    var ListMovies: some View {
        List{
            ForEach(popularMovies, id: \.self) { movie in
                NavigationLink(destination: DetailView(title: movie.title, overview: movie.overview, rate: "\(movie.vote_average)", poster: movie.poster_path)) {
                    Cell(title: movie.title, overview: movie.overview, rate: "\(movie.vote_average)", image: movie.poster_path)
                }
                
            }
        }
        .navigationBarTitle("MoviesDB", displayMode: .large)
    }
}
 

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


