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
        VStack(alignment: .leading) {
            HStack {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 130, height: 195)
                    .cornerRadius(10)
                
                VStack(alignment: .leading, spacing: 55) {
                    
                    Text(title)
                        .font(.title)
                        .fontWeight(.medium)
                        .lineLimit(1)
                    
       
                    Text("Action, Animation, Family")
                        .font(.subheadline)
                               .fontWeight(.thin)
                               .lineLimit(3)
//                               .frame(width: 260)
                    
                    HStack {
                        Image("star")
                        Text(vote_average)
                            .font(.subheadline)
                            .fontWeight(.thin)
                            .frame(width: 35)
                    }
                }
                .padding(.leading)
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

