//
//  DetailView.swift
//  TheMovieDB-SwiftUI
//
//  Created by Ronald Maciel on 07/04/20.
//  Copyright © 2020 Ronald Maciel. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    var title = "Joker"
    var overview = "JokerJokerJokerJokerJokerJokerJokerJoker"
    var vote_average = "5"
    var poster_path = ""
    @State var image = UIImage()
    
    
    var body: some View {
        VStack {
            HStack {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 130, height: 195)
                    .cornerRadius(10)
                
                VStack(alignment: .leading) {
                    
                    Rectangle()
                        .frame(width: 20, height: 60, alignment: .leading)
                        .foregroundColor(.clear)
                    
                    
                    Text(title)
                        .font(.title)
                        .fontWeight(.medium)
                        .lineLimit(1)
                    
                    Text("In here it was supposed to have the genrer list... but... yeah.. :)")
                        .font(.subheadline)
                        .fontWeight(.thin)
                        .lineLimit(3)
                        .frame(width: 260)
                        .padding(.trailing, 4)
                    
                    
                    HStack {
                        Image("star")
                        Text(vote_average)
                            .font(.subheadline)
                            .fontWeight(.thin)
                            .frame(width: 35)
                    }
                    .padding(5)
                }
            }
            .navigationBarTitle("Detail", displayMode: .inline)
            .onAppear() {
                Network.sharedInstance.fetchImageWithURL(poster_path: self.poster_path, completion: { result in
                    DispatchQueue.main.async {
                        self.image = result
                    }
                })
            }
            HStack {
                Text("Overview")
                    .fontWeight(.bold)
                
                Rectangle()
                    .frame(width: 310, height: 20, alignment: .trailing)
                    .foregroundColor(.clear)
            }
            
            Text(overview)
                .font(.subheadline)
                .fontWeight(.thin)
                .padding()
            
            Rectangle()
                .frame(width: 1, height: 400, alignment: .center)
                .foregroundColor(.clear)
        }
        
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}

