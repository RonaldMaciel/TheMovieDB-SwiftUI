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
    
    @State var image: UIImage = UIImage()
    
    var body: some View {
        
        NavigationView {
            
            // Display the Popular and the Now Playing Sections
            ListMovies
                .navigationBarTitle("MoviesDB", displayMode: .large)
            
        }.onAppear() { // viewDidLoad()
            UITableView.appearance().separatorStyle = .none
            
            Network.sharedInstance.fetchMovies(with: .POPULAR, completion: { result in
                
                switch result {
                case .success(let movies):
                    DispatchQueue.main.async {
                        self.popularMovies = movies
                        //                        print(self.popularMovies.count)
                    }
                case .failure(_):
                    print("fail to fetch POPULAR MOVIES")
                }
            })
            
            Network.sharedInstance.fetchMovies(with: .NOWPLAYING, completion: { result in
                
                switch result {
                case .success(let movies):
                    DispatchQueue.main.async {
                        self.nowPlayingMovies = movies
                    }
                case .failure(_):
                    print("fail to fetch NOW PLAYING MOVIES")
                }
            })
        }
    }
    
    
    var ListMovies: some View {
        List{
            
            // Popular Section
            Text("Popular")
                .font(.headline)
                .fontWeight(.bold)
            
                ScrollView(.horizontal,showsIndicators: false ) {
                    HStack {
                        ForEach(popularMovies, id: \.self) { movie in
                            NavigationLink(destination: DetailView(title: movie.title, overview: movie.overview, vote_average: "\(movie.vote_average)", poster_path: movie.poster_path)) {
                                Cell(title: movie.title, overview: movie.overview, vote_average: "\(movie.vote_average)", poster_path: movie.poster_path)
                            }
                            
                            
                        }
                    }
                }
            
            // Now Playing Section
            Group {
                Text("Now Playing")
                    .font(.headline)
                    .fontWeight(.bold)
                
                ForEach(nowPlayingMovies, id: \.self) { movie in
                    NavigationLink(destination: DetailView(title: movie.title, overview: movie.overview, vote_average: "\(movie.vote_average)", poster_path: movie.poster_path)) {
                        Cell(title: movie.title, overview: movie.overview, vote_average: "\(movie.vote_average)", poster_path: movie.poster_path)
                    }
                    
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


