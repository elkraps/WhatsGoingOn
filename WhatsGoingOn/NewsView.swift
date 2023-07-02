//
//  NewsView.swift
//  WhatsGoingOn
//
//  Created by Vlad Dzirko on 30.06.2023.
//

import SwiftUI

struct NewsView: View {
    
    var articles: [Article]
    @State var shouldPresent: Bool = false
    @State var articleURL: URL?
    var body: some View {
        
        ForEach(articles) { article in
            VStack(alignment: .leading) {
                ArticleImage(imageLoader: ImageLoaderCache.shared.loaderFor(
                    article: article))
                //                    .frame(maxWidth: .infinity)
                .padding(.top)
                
                
                Text("\(article.source.name != nil ? article.source.name! : "")")
                    .font(.custom("AlbertSans-Light", size: 15))
                    .padding(4)
                    .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                
                Text("\(article.title)")
                    .font(.custom("AlbertSans-Light", size: 28))
                    .foregroundColor(Color(hex: "BB443D"))
                    .lineLimit(2)
                
                
                Spacer()
                
                HStack {
                    Text(APIConstants.formatter.string(from: article.publishedAt!))
                        .opacity(0.5)
                    Text("|  \(article.author != nil ? article.author! : "")")
                        .lineLimit(1)
                    //Text("\(article.source.name != nil ? article.source.name! : "")")
                }
                .foregroundColor(Color.black)
//                    Text("\( article.description != nil ? article.description! : "")")
//                        .lineLimit(3)
                
                Button(
                    action: {

                    },
                    label: {
                        Text("Read")
                            .foregroundColor(Color.blue)
                    }
                )
            }
            .frame(maxWidth: .infinity, maxHeight: 400)
            
                
            //                .background(Color.gray)
            
        }
        
    }
}


let calendar = Calendar.current
let components = DateComponents(calendar: calendar, year: 2023, month: 6, day: 30)
let sampleArticle = Article(
    title: "Chiness thinking",
    description: "To see a rainbow, you must have the sun shining behind you and the water droplets in front of you.To see a rainbow, you must have the sun shining behind you and the water droplets in front of you.To see a rainbow, you must have the sun shining behind you and the water droplets in front of you.To see a rainbow, you must have the sun shining behind you and the water droplets in front of you.",
    author: "Gordon Ramzey",
    urlToImage: "https://s.abcnews.com/images/Business/WireAP_6b82fe19ed404b0b8e96c9f4c9371e7c_16x9_992.jpg",
    publishedAt: calendar.date(from: components)!,
    source: Source(id: "id",
                   name: "BBC",
                   description: "They are thinking",
                   country: "China",
                   category: "Economics",
                   url: "url"))

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(articles: [sampleArticle])
    }
}
