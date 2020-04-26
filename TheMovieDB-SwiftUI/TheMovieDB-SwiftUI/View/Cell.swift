//
//  Cell.swift
//  TheMovieDB-SwiftUI
//
//  Created by Ronald Maciel on 07/04/20.
//  Copyright © 2020 Ronald Maciel. All rights reserved.
//

import SwiftUI

struct Cell: View {
    
    var title: String = ""
    var overview: String  = ""
    var vote_average: String  = ""
    var poster_pathh: String  = ""
    
    @State var imagee: UIImage = UIImage()
    
    init(title: String, overview: String, vote_average: String, poster_path: String) {
        self.title = title
        self.overview = overview
        self.vote_average = vote_average
        self.poster_pathh = poster_path
    }
    
    var body: some View {
        HStack{
            Image(uiImage: imagee).renderingMode(.original)
                .resizable()
                .frame(width: 80, height: 118)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title)
                    .fontWeight(.medium)
                    .lineLimit(1)
                    .foregroundColor(Color.primary)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                    
                
                Text(overview)
                    .font(.subheadline)
                    .fontWeight(.thin)
                    .lineLimit(3)
                    .frame(width: 260)
                    .foregroundColor(Color.gray)

                
                HStack {
                    Image("star")
                    Text(vote_average)
                        .font(.subheadline)
                        .fontWeight(.thin)
                        .frame(width: 35)

                }
                .foregroundColor(Color.primary)
            }
        }
        .onAppear() {
            
            Network.sharedInstance.fetchImageWithURL(poster_path: self.poster_pathh, completion: { result in
                DispatchQueue.main.async {
                    self.imagee = result
                }
            })
        }
    }
}


struct Cell_Previews: PreviewProvider {
    static var previews: some View {
        Cell(title: "Joker ", overview: "Genre lIST", vote_average: "99", poster_path: "")
    }
}

//struct Cell_Previews: PreviewProvider {
//    static var previews: some View {
//        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
//    }
//}
