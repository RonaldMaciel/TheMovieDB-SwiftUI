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
        //        NavigationView {
        //            List(0 ..< 5) { item in
        HStack {
            Image("joker")
                .resizable()
                .frame(width: 80, height: 118)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text("Joker")
                    .font(.title)
                    .lineLimit(1)
                
                
                Text("overviewaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
                    .font(.subheadline)
                    .fontWeight(.thin)
                    .lineLimit(3)
                    .frame(width: 260)
                
                
                HStack {
                    Text("*")
                    Text("999")
                        .font(.subheadline)
                        .fontWeight(.thin)
                        .frame(width: 35)
                }
                .padding(5)
                
            }
            
        }
        //            }.navigationBarTitle("MovieDB")
        //        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
