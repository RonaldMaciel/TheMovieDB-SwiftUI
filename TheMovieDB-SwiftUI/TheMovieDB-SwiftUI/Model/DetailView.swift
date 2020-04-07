//
//  DetailView.swift
//  TheMovieDB-SwiftUI
//
//  Created by Ronald Maciel on 05/04/20.
//  Copyright © 2020 Ronald Maciel. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    let artwork: Artwork
    
    var body: some View {
        VStack {
            Image(artwork.imageName)
                .resizable()
                .frame(maxWidth: 300, maxHeight: 600)
                .aspectRatio(contentMode: .fit)
            
            Text("\(artwork.reaction) - \(artwork.title)")
                .navigationBarTitle(Text(artwork.title), displayMode: .inline)
                .font(.headline)
                .multilineTextAlignment(.center)
                .lineLimit(3)
               
            Text(artwork.locationName)
                .font(.subheadline)
            
            Divider()
            
            Text(artwork.description)
                .multilineTextAlignment(.leading)
            .lineLimit(20)
        }.padding()
            .navigationBarTitle(Text(artwork.title), displayMode: .inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(artwork: artData[0])
    }
}
