//
//  NewsImage.swift
//  WhatsGoingOn
//
//  Created by Vlad Dzirko on 01.07.2023.
//

import SwiftUI

struct ArticleImage: View {
    @ObservedObject var imageLoader: ImageLoader
    @State private var animate = false
    
    var body: some View {
        Group {
            if !imageLoader.noData {
             ZStack {
                if self.imageLoader.image != nil {
                    Image(uiImage: self.imageLoader.image!)
                    .resizable()
                    .scaledToFit()
                } else {
                    if imageLoader.url != nil {
                        Rectangle()
                        .foregroundColor(.gray)
                        .frame(width: (UIScreen.main.bounds.width) * 0.75,
                               height: UIScreen.main.bounds.width  * 0.6,
                               alignment: .center)
                        .scaledToFit()
                        .overlay(
                            Text("Loading...")
                            .font(.footnote)
                            .foregroundColor(.white)
                            .rotationEffect(Angle(degrees: animate ? 60 : -60))
                            .onAppear {
                              withAnimation(Animation.easeInOut(duration: 1.0).repeatForever()) {
                                            self.animate = true
                              }
                            }
                         ) 
                    } else {
                        EmptyView()
                    }
                }
             }
            } else {
                EmptyView()
            }
        }
    }
}

struct ArticleImage_Previews: PreviewProvider {
    static var previews: some View {
        ArticleImage(imageLoader: ImageLoader (url: URL(string: "https://s.abcnews.com/images/Business/WireAP_6b82fe19ed404b0b8e96c9f4c9371e7c_16x9_992.jpg")))
      
    }
}
