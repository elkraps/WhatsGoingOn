//
//  FavouriteItemView.swift
//  WhatsGoingOn
//
//  Created by Vlad Dzirko on 20.07.2023.
//

import SwiftUI

struct FavouriteItemView: View {
    
    var article: Article
    
    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: article.imageURL) {
                phase in
                switch phase {
                case .empty:
                    HStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                case .failure:
                    HStack {
                        Spacer()
                        Image(systemName: "photo")
                            .imageScale(.large)
                        Spacer()
                    }
                @unknown default:
                    fatalError()
                }
            }
            .frame(width: 100, height: 100)
            .cornerRadius(15)
            
            VStack(alignment: .leading, spacing: 10){
                Text(article.title)
                Text(article.captionText)
                    .opacity(0.4)
            }
        }
    }
}

struct FavouriteItemView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteItemView(article: .previewData[1])
    }
}
